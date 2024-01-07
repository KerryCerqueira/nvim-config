return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {
					src = {
						cmp = { enabled = true },
					},
				},
			},
		},
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			vim.list_extend(opts.sources, { { name = "crates" }, })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "taplo" })
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		event = { "BufRead *.rs" },
		opts = {
			server = {
				on_attach = function(_, bufnr)
					local rt = require("rust-tools")
					require("lsp").default_on_attach(_, bufnr)
					vim.keymap.set(
						{ "n", "v" }, "K",
						rt.hover_actions.hover_actions,
						{
							buffer = bufnr,
							silent = true,
							noremap = true,
							desc = "See available hover actions",
						}
					)
					vim.keymap.set(
						{ "n", "v" },
						"<Leader>ca",
						rt.code_action_group.code_action_group,
						{
							buffer = bufnr,
							silent = true,
							noremap = true,
							desc = "See available code actions",
						}
					)
					local group_id = vim.api.nvim_create_augroup("RustLSP", {clear = true})
					vim.api.nvim_create_autocmd(
						"CursorHold",
						{
							group = group_id,
							pattern = "*.rs",
							callback = vim.lsp.buf.document_highlight
						}
					)
					vim.api.nvim_create_autocmd(
						{ "CursorMoved", "InsertEnter" },
						{
							group = group_id,
							pattern = "*.rs",
							callback = vim.lsp.buf.clear_references
						}
					)
					vim.api.nvim_create_autocmd(
						{ "BufEnter", "CursorHold", "InsertLeave"},
						{
							group = group_id,
							pattern = "*.rs",
							callback = vim.lsp.codelens.refresh
						}
					)
				end,
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				taplo = {
					on_attach = function()
						require("lsp").default_on_attach()
						vim.api.nvim_create_autocmd(
							{"BufRead", "BufNewFile"},
							{
								group = vim.api.nvim_create_augroup(
									"cargo_toml_documentation",
									{ clear = true }
								),
								pattern = "Cargo.toml",
								callback = function()
									vim.set.keymap(
										{ "n", "v" },
										"K",
										function()
											if require("crates").popup_available() then
												require("crates").show_popup()
											else
												vim.lsp.buf.hover()
											end
										end,
										{
											buffer = 0, noremap = true, silent = true,
											Desc = "Show crate documentation",
										}
									)
								end,
							}
						)
					end,
				},
			},
		},
	},
	-- {
	-- 	"nvim-neotest/neotest",
	-- 	optional = true,
	-- 	dependencies = {
	-- 		"rouge8/neotest-rust",
	-- 	},
	-- 	opts = {
	-- 		adapters = {
	-- 			["neotest-rust"] = {},
	-- 		},
	-- 	},
	-- },
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "codelldb" })
		end,
	},
}
