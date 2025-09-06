{ pkgs, ...}:

{
	xdg.configFile."nvim/lua/plugins/lang/yaml.lua".source =
		../../../lua/plugins/lang/yaml.lua;
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
}
