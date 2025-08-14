{ pkgs, ... }:

{
	xdg.configFile = {
		"nvim/lua/plugins/ui/lualine-nvim.lua".source =
			../../../lua/plugins/ui/lualine-nvim.lua;
	};
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			copilot-lualine
			lualine-nvim
			lualine-lsp-progress
		];
	};
}
