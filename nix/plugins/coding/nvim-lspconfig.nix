{ pkgs, ... }:

{
	programs.neovim.plugins = with pkgs.vimPlugins; [
		blink-cmp
		nvim-lspconfig
		neoconf-nvim
	];
	xdg.configFile = {
		"nvim/lua/plugins/coding/nvim-lspconfig.lua".source =
			../../../lua/plugins/coding/nvim-lspconfig.lua;
	};
}
