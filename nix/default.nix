{ luaModules }: { pkgs, config, ... }:
let
	nvimPlugDirs = config.programs.neovim.finalPackage.passthru.packpathDirs;
	nvimPackDir = pkgs.vimUtils.packDir nvimPlugDirs;
in {
	imports = [
		(import ./lang { inherit luaModules; })
		(import ./ui.nix { inherit luaModules; })
		(import ./coding.nix { inherit luaModules; })
		(import ./editing.nix { inherit luaModules; })
		(import ./git.nix { inherit luaModules; })
	];
	programs.neovim = {
		enable = true;
		withRuby = true;
		withNodeJs= true;
		withPython3= true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			lazy-nvim
		];
		extraLuaConfig = # lua
			''
			vim.g.mapleader = " "
			vim.g.maplocalleader = ","
			require("lazy").setup({
				spec = {
					{ import = "plugins" },
					{ import = "lang" },
					{
						"folke/lazydev.nvim",
						optional = true,
						opts = {
							library = { "${nvimPackDir}/pack/myNeovimPackages/start" },
						},
					},
					{
						{ "williamboman/mason-lspconfig.nvim", enabled = false },
						{ "williamboman/mason.nvim", enabled = false },
					},
					{
						{
							"nvim-treesitter/nvim-treesitter",
							opts = {
								auto_install = false,
								ensure_installed = {},
							},
							build = nil
						},
					},
				},
				dev = {
					path = "${nvimPackDir}/pack/myNeovimPackages/start",
					patterns = {""},
				},
				performance = {
					reset_packpath = false,
					rtp = { reset = false, },
				},
				install = { missing = false, },
			})
			'';
	};
}
