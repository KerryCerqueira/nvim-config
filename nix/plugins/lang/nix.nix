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
	xdg.configFile."nvim/lua/plugins/lang/nix.lua".source = ../../../lua/plugins/lang/nix.lua;
}
