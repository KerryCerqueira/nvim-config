{ pkgs, ... }:

{
	programs.neovim.plugins = [ pkgs.vimPlugins.nvim-lint ];
	xdg.configFile = {
		"nvim/lua/plugins/editing/nvim-lint.lua".source =
			../../../lua/plugins/editing/nvim-lint.lua;
	};
}
