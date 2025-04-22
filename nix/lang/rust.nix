{ luaModules, ... }: { pkgs, ...}:
let
	rustLuaModule = luaModules + /lang/rust.lua;
in {
	xdg.configFile."nvim/lua/lang/rust.lua".source = rustLuaModule;
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			rustaceanvim
			crates-nvim
		];
	};
}
