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
		"mfussenegger/nvim-dap",
		optional = true,
		dependencies = {
			"mfussenegger/nvim-dap-python",
			keys = {
				{ "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
				{ "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
			},
		},
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
		cmd = "VenvSelect",
		opts = {
			dap_enabled = true,
			name = {
				"venv",
				".venv",
				"env",
				".env",
			},
			anaconda_base_path = "/home/kerry/miniforge3",
			anaconda_envs_path = "/home/kerry/miniforge3/envs"
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
