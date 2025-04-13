{ luaModules }: { pkgs, ...}:
let
	jsonLuaModule = luaModules + /plugins/lang/json.lua;
in {
	programs.neovim = {
		extraPackages = with pkgs; [
			vscode-langservers-extracted
			nodePackages.prettier
		];
		plugins = with pkgs.vimPlugins; [
			SchemaStore-nvim
			conform-nvim
		];
	};
	xdg.configFile."nvim/lua/lang/json.lua".source = jsonLuaModule;
}
