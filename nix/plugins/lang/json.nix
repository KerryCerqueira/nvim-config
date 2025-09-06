{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			vscode-langservers-extracted
			nodePackages.prettier
		];
		plugins = with pkgs.vimPlugins; [
			conform-nvim
			nvim-lspconfig
			SchemaStore-nvim
		];
	};
	xdg.configFile."nvim/lua/plugins/lang/json.lua".source = ../../../lua/plugins/lang/json.lua;
}
