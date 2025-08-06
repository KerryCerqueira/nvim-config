{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.substitute-nvim ];
	xdg.configFile = {
		"nvim/lua/plugins/editing/substitute-nvim.lua".source =
			../../../lua/plugins/editing/substitute-nvim.lua;
	};
}
