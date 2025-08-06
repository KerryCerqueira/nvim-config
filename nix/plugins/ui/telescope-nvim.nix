{ pkgs, ... }:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			manix
			ripgrep
			fd
			zf
		];
		plugins = with pkgs.vimPlugins; [
			nvim-web-devicons
			plenary-nvim
			telescope-frecency-nvim
			telescope-manix
			telescope-nvim
			telescope-symbols-nvim
			telescope-undo-nvim
			telescope-zf-native-nvim
		];
	};
	xdg.configFile = {
		"nvim/lua/plugins/ui/telescope-nvim.lua".source =
			../../../lua/plugins/ui/telescope-nvim.lua;
	};
}
