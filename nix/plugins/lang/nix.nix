{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			alejandra
			nil
		];
		plugins = with pkgs.vimPlugins; [
			nvim-lspconfig
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
	xdg.configFile = {
      "nvim/ftplugin/nix.lua".source = ../../../ftplugin/nix.lua;
		"nvim/lua/plugins/lang/nix.lua".source = ../../../lua/plugins/lang/nix.lua;
		"nvim/lsp/nil_ls.lua".source = ../../../lsp/nil_ls.lua;
	};
}
