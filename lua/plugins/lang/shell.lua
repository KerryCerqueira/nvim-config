return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {
					filetypes = { "bash", "sh", "zsh",},
				},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				bash = { "shellcheck" },
			},
		},
	}
}
