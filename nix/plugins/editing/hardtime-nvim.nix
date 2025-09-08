{ pkgs, ... }:

{
	programs.neovim.plugins = with pkgs.vimPlugins; [
		hardtime-nvim
		nui-nvim
	];
	xdg.configFile = {
		"nvim/lua/plugins/editing/hardtime-nvim.lua".source =
			../../../lua/plugins/editing/hardtime-nvim.lua;
	};
}
