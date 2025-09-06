{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			pyright
			jdt-language-server
			ruff
		];
		plugins = with pkgs.vimPlugins; [
			neogen
			nvim-lspconfig
		];
	};
	xdg.configFile."nvim/lua/plugins/lang/python.lua".source = ../../../lua/plugins/lang/python.lua;
}
