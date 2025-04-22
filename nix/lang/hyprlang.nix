{ luaModules, ... }: { pkgs, ...}:
let
	hyprlangLuaModule = luaModules + /lang/hyprlang.lua;
in {
	xdg.configFile."nvim/lua/lang/hyprlang.lua".source = hyprlangLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			hyprls
		];
	};
}
