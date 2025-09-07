{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			markdownlint-cli2
			marksman
			python312Packages.pylatexenc
			nodePackages.prettier
		];
		plugins = with pkgs.vimPlugins; [
			render-markdown-nvim
			img-clip-nvim
			nvim-lint
			nvim-lspconfig
			conform-nvim
		];
	};
	xdg.configFile = {
		"nvim/lua/plugins/lang/markdown.lua".source =
			../../../lua/plugins/lang/markdown.lua;
		"nvim/lsp/marksman.lua".source =
			../../../lsp/marksman.lua;
	};
}
