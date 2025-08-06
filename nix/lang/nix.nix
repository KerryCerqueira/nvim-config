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
	xdg.configFile."nvim/lua/lang/nix.lua".source = ../../lua/lang/nix.lua;
}
