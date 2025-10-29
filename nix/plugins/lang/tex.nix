{ pkgs, ...}:

{
	home.packages = with pkgs; [
		zathura
	];
	programs.neovim = {
		extraPackages = with pkgs; [
			texlab
		];
		plugins = with pkgs.vimPlugins; [
			vimtex
			img-clip-nvim
			nvim-treesitter.withAllGrammars
			nvim-lint
		];
	};
	xdg.configFile = {
    "nvim/ftplugin/tex.lua".source = ../../../ftplugin/tex.lua;
		"nvim/lua/plugins/lang/tex.lua".source = ../../../lua/plugins/lang/tex.lua;
		"nvim/lsp/texlab.lua".source = ../../../lsp/texlab.lua;
	};
}
