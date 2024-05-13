return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		diagnostics = {
			underline = true,
			update_in_insert = false,
			virtual_text = false,
			severity_sort = true,
		},
		inlay_hints = {
			enabled = true,
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd(
			'LspAttach',
			{
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
					require("lsp").default_on_attach(ev.buf)
				end,
			}
		)
		for name, icon in pairs(require("icons").lspconfig_diagnostic_icons) do
			name = "DiagnosticSign" .. name
			vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end
		vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

		local servers = opts.servers
		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities(),
			opts.capabilities or {}
		)

		local function setup(server)
			local server_opts = vim.tbl_deep_extend(
				"force",
				{ capabilities = vim.deepcopy(capabilities), },
				servers[server] or {}
			)
			if (opts.setup or {})[server] then
				if opts.setup[server](server, server_opts) then
					return
				end
			end
			require("lspconfig")[server].setup(server_opts)
		end


		for server, server_opts in pairs(servers) do
			-- print("setting up " .. server)
			if server_opts then
				-- print("server ops not empty...")
				server_opts = server_opts == true and {} or server_opts
				setup(server)
			end
		end
	end,
}
