return {
	"neovim/nvim-lspconfig",
	dependencies = {
		'saghen/blink.cmp',
		{
			"folke/neoconf.nvim",
			opts = {
				import = {
					vscode = false,
					coc = false,
					nlsp = false,
				},
			},
		},
	},
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"gD",
			vim.lsp.buf.declaration,
			desc = "Go to declaration"
		},
		{
			"<Leader>ca",
			vim.lsp.buf.code_action,
			desc = "See available code actions"
		},
		{
			"<Leader>rn",
			vim.lsp.buf.rename,
			desc = "Smart rename"
		},
		{
			"<Leader>d",
			vim.diagnostic.open_float,
			desc = "Show line diagnostics"
		},
		{
			"<Leader>rs",
			":LspRestart<CR>",
			desc = "Restart LSP"
		},
	},
	init = function()
		vim.api.nvim_create_autocmd(
			'LspAttach',
			{
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
				end,
			}
		)
		vim.lsp.inlay_hint.enable(true)
	end,
	config = function(_, opts)
		local lspconfig = require("lspconfig")
		local blink = require("blink.cmp")
		for server, config in pairs(opts.servers) do
			config.capabilities = blink.get_lsp_capabilities(config.capabilities)
			lspconfig[server].setup(config)
		end
	end,
}
