return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "ninja", "python", "rst", "toml" })
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
				ruff_lsp = {
					keys = {
						{
							"<leader>co",
							function()
								vim.lsp.buf.code_action({
									apply = true,
									context = {
										only = { "source.organizeImports" },
										diagnostics = {},
									},
								})
							end,
							desc = "Organize Imports",
						},
					},
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(
				opts.ensure_installed,
				{ "ruff_lsp", "pyright" }
			)
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		cmd = "VenvSelect",
		opts = {
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
			anaconda_base_path = "/home/kerry/miniconda3",
			anaconda_envs_path = "/home/kerry/miniconda3/envs"
		},
		keys = {
			{
				"<leader>Pv",
				"<cmd>:VenvSelect<cr>",
				desc = "Select VirtualEnv"
			}
		},
	},
}
