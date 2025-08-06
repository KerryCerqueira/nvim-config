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
	xdg.configFile."nvim/lua/lang/tex.lua".source = ../../lua/lang/tex.lua;
}
