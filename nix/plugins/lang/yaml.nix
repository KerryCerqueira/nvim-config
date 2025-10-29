{ pkgs, ... }:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			nodePackages.prettier
			yaml-language-server
		];
		plugins = with pkgs.vimPlugins; [
			SchemaStore-nvim
			conform-nvim
			nvim-lspconfig
		];
	};
	xdg.configFile = {
    "nvim/ftplugin/yaml.lua".source =
      ../../../ftplugin/yaml.lua;
		"nvim/lua/plugins/lang/yaml.lua".source =
			../../../lua/plugins/lang/yaml.lua;
		"nvim/lsp/yamlls.lua".source =
			../../../lsp/yamlls.lua;
	};
}
