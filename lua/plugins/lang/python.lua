return {
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
