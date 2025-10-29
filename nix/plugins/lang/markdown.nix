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
			conform-nvim
			img-clip-nvim
			nvim-lint
			nvim-lspconfig
			render-markdown-nvim
			snacks-nvim
		];
	};
	xdg.configFile = {
    "nvim/ftplugin/markdown.lua".source =
      ../../../ftplugin/markdown.lua;
		"nvim/lua/plugins/lang/markdown.lua".source =
			../../../lua/plugins/lang/markdown.lua;
		"nvim/lsp/marksman.lua".source =
			../../../lsp/marksman.lua;
	};
}
