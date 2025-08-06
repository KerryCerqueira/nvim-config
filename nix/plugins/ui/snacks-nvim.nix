{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.snacks-nvim ];
	xdg.configFile = {
		"nvim/lua/plugins/ui/snacks-nvim.lua".source =
			../../../lua/plugins/ui/snacks-nvim.lua;
	};
}
