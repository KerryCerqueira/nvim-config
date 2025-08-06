{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.gitsigns-nvim ];
	xdg.configFile."nvim/lua/plugins/git/gitsigns-nvim.lua".source =
		../../../lua/plugins/git/gitsigns-nvim.lua;
}
