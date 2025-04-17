{ luaModules }: { pkgs, ...}:
let
	tomlLuaModule = luaModules + /lang/toml.lua;
in {
	xdg.configFile."nvim/lua/lang/toml.lua".source = tomlLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			nodePackages.prettier
			taplo
		];
		plugins = with pkgs.vimPlugins; [
			conform-nvim
		];
	};
}
