return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nixd = {
					nixpkgs = {
						expr = "import <nixpkgs> { }",
					},
					formatting = {
						command = { "alejandra" },
					},
					options = {
						nixos = {
							expr = "nixpkgs#nixos-options";
						},
						home_manager =  {
							expr =  "(import <home-manager/modules> { configuration = ~/.config/home-manager/home.nix; pkgs = import <nixpkgs> {}; }).options"
						},
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "nix", },},
	},
}
