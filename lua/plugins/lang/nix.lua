return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nil_ls = {},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "nix", },},
	},
}
