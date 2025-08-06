{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.mini-bracketed ];
	xdg.configFile = {
		"nvim/lua/plugins/editing/mini-bracketed.lua".source =
			../../../lua/plugins/editing/mini-bracketed.lua;
	};
}
