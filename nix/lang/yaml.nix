{ pkgs, ...}:

{
	xdg.configFile."nvim/lua/lang/yaml.lua".source = ../../lua/lang/yaml.lua;
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
