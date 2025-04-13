{ luaModules }: { pkgs, ...}:
let
	hyprlangLuaModule = luaModules + /plugins/lang/hyprlang.lua;
in {
	xdg.configFile."nvim/lua/lang/hyprlang.lua".source = hyprlangLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			hyprls
		];
	};
}
