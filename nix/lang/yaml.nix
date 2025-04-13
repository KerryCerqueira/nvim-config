{ luaModules }: { pkgs, ...}:
let
	yamlLuaModule = luaModules + /plugins/lang/yaml.lua;
in {
	xdg.configFile."nvim/lua/lang/yaml.lua".source = yamlLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			nodePackages.prettier
			yaml-language-server
		];
		plugins = with pkgs.vimPlugins; [
			SchemaStore-nvim
			conform-nvim
		];
	};
}
