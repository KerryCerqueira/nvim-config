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
							"<localleader>co",
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
					init_options = {
						settings = {
							lineLength = 79,
							format = {
								indentStyle = "tab",
								docstringCodeFormat = true,
							},
						},
					},
				},
			},
		},
	},
	{
		"danymat/neogen",
		opts = {
			languages = {
				python = {
					template = {
						annotation_convention = "reST",
					},
				},
			},
		},
	},
}
