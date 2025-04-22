{ pkgs, config }:
let
	nvimPlugDirs = config.programs.neovim.finalPackage.passthru.packpathDirs;
	nvimPackDir = pkgs.vimUtils.packDir nvimPlugDirs;
in
{
	mason = builtins.readFile ./lua/mason.lua;
	treesitter = builtins.readFile ./lua/treesitter.lua;
	catppuccin = # lua
		''
		return {
			"catppuccin/nvim",
			optional = true,
			dir = "${pkgs.vimPlugins.catppuccin-nvim}",
		}
		'';
		neodev = # lua
		''
		return {
			"folke/lazydev.nvim",
			optional = true,
			opts = {
				library = { "${nvimPackDir}/pack/myNeovimPackages/start" },
			},
		}
		'';
}
