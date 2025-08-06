{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.bufferline-nvim ];
	xdg.configFile = {
		"nvim/lua/plugins/ui/bufferline.lua".source =
			../../../lua/plugins/ui/bufferline.lua;
	};
}
