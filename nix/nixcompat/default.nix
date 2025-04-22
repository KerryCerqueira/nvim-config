{ pkgs }:
{
	mason = builtins.readFile ./lua/mason.lua;
	treesitter = builtins.readFile ./lua/treesitter.lua;
	catppuccin = # lua
		''
		return {
			"catppuccin/nvim",
			dir = "${pkgs.vimPlugins.catppuccin-nvim}",
		}
		'';
}
