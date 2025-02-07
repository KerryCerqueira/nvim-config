return {
	{
		"Vigemus/iron.nvim",
		opts = {
			config = {
				repl_definition = {
					python = require("iron.fts.python").ipython,
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				pyright = {},
				ruff = {
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
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				python = { black = { prepend_args = { "--line-length=79" } } },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				python = { "flake8" },
			},
		},
	},
}
