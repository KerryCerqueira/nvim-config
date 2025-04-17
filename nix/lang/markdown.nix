{ luaModules }: { pkgs, ...}:
let
	markdownLuaModule = luaModules + /lang/markdown.lua;
in {
	xdg.configFile."nvim/lua/lang/markdown.lua".source = markdownLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			markdownlint-cli2
			marksman
			python312Packages.pylatexenc
			nodePackages.prettier
		];
		plugins = with pkgs.vimPlugins; [
			snacks-nvim
			render-markdown-nvim
			nvim-lint
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
}
