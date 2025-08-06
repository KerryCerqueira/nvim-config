{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.nvim-various-textobjs ];
	xdg.configFile = {
		"nvim/lua/plugins/editing/nvim-various-textobjs.lua".source =
			../../../lua/plugins/editing/nvim-various-textobjs.lua;
	};
}
