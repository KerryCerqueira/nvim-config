{ pkgs, ... }:

{
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			nvim-ufo
			promise-async
		];
	};
	xdg.configFile = {
		"nvim/lua/plugins/ui/nvim-ufo.lua".source =
			../../../lua/plugins/ui/nvim-ufo.lua;
	};
}
