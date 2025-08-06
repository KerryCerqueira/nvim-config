{ pkgs, ...}:
let
	markdownLuaModule = ../../lua/lang/markdown.lua;
in {
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
	xdg.configFile."nvim/lua/lang/markdown.lua".source = markdownLuaModule;
}
