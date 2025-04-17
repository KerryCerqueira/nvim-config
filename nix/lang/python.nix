{ luaModules }: { pkgs, ...}:
let
	pythonLuaModule = luaModules + /lang/python.lua;
in {
	xdg.configFile."nvim/lua/lang/python.lua".source = pythonLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			pyright
			jdt-language-server
			ruff
		];
		plugins = with pkgs.vimPlugins; [
			iron-nvim
			neogen
		];
	};
}
