{ luaModules }: { pkgs, ...}:
let
	shellLuaModule = luaModules + /plugins/lang/shell.lua;
in {
	xdg.configFile."nvim/lua/lang/shell.lua".source = shellLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			bash-language-server
			fish-lsp
			shellcheck
		];
		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
}
