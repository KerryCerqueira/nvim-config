{ luaModules, compatModules }: { pkgs, ...}:
let
	nixLuaModule = luaModules + /lang/nix.lua;
in {
	xdg.configFile = {
		"nvim/lua/lang/nix.lua".source = nixLuaModule;
		"nvim/lua/nixcompat/neodev.lua".text = compatModules.neodev;
	};
	programs.neovim = {
		extraPackages = with pkgs; [
			alejandra
			nil
		];
		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
}
