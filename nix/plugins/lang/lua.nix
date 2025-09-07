{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			stylua
			lua-language-server
		];
		plugins = with pkgs.vimPlugins; [
			lazydev-nvim
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
	xdg.configFile = {
		"nvim/lua/plugins/lang/lua.lua".source = ../../../lua/plugins/lang/lua.lua;
		"nvim/lsp/lua_ls.lua".source = ../../../lsp/lua_ls.lua;
	};
}
