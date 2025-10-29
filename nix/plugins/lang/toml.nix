{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			nodePackages.prettier
			taplo
		];
		plugins = with pkgs.vimPlugins; [
			conform-nvim
			nvim-lspconfig
		];
	};
	xdg.configFile = {
    "nvim/ftplugin/toml.lua".source =
      ../../../ftplugin/toml.lua;
		"nvim/lua/plugins/lang/toml.lua".source =
			../../../lua/plugins/lang/toml.lua;
		"nvim/lsp/taplo.lua".source =
			../../../lsp/taplo.lua;
	};
}
