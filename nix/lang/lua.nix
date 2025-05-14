{ luaModules, compatModules, ... }: { pkgs, ...}:
let
	luaLuaModule = luaModules + /lang/lua.lua;
in {
	xdg.configFile = {
		"nvim/lua/lang/lua.lua".source = luaLuaModule;
		"nvim/lua/nixcompat/neodev.lua".text = compatModules.neodev;
	};
	programs.neovim = {
		extraPackages = with pkgs; [
			stylua
			lua-language-server
		];
		plugins = with pkgs.vimPlugins; [
			neodev-nvim
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
}
