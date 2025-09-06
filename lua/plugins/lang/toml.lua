return {
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				toml = { "prettier" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				taplo = {},
			},
		},
	},
}
