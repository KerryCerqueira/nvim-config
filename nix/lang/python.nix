{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			pyright
			jdt-language-server
			ruff
		];
		plugins = with pkgs.vimPlugins; [
			neogen
			nvim-lspconfig
		];
	};
	xdg.configFile."nvim/lua/lang/python.lua".source = ../../lua/lang/python.lua;
}
