{ luaModules }: { pkgs, ...}:
let
	pythonLuaModule = luaModules + /plugins/lang/python.lua;
in {
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
	xdg.configFile."nvim/lua/lang/python.lua".source = pythonLuaModule;
}
