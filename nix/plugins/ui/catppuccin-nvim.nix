{ pkgs, ... }:

{
	 	programs.neovim.plugins = [ pkgs.vimPlugins.catppuccin-nvim ];
 	xdg.configFile = {
 		"nvim/lua/plugins/ui/catppuccin-nvim.lua".source =
 			../../../lua/plugins/ui/catppuccin-nvim.lua;
 	};
}
