return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				hyprls = {},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "hyprlang", },},
	},
}
