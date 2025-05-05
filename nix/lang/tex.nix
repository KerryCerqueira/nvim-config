{ luaModules, ... }: { pkgs, ...}:
let
	texLuaModule = luaModules + /lang/tex.lua;
in {
	xdg.configFile."nvim/lua/lang/tex.lua".source = texLuaModule;
	home.packages = with pkgs; [
		zathura
	];
	programs.neovim = {
		extraPackages = with pkgs; [
			texliveMedium
			texlab
		];
		plugins = with pkgs.vimPlugins; [
			vimtex
			img-clip-nvim
			nvim-treesitter.withAllGrammars
			nvim-lint
		];
	};
}
