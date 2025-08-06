{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			stylua
			lua-language-server
		];
		plugins = with pkgs.vimPlugins; [
			neodev-nvim
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
	xdg.configFile = {
		"nvim/lua/lang/lua.lua".source = ../../lua/lang/lua.lua;
	};
}
