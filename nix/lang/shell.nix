{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			bash-language-server
			fish-lsp
			shellcheck
		];
		plugins = with pkgs.vimPlugins; [
			nvim-lspconfig
			nvim-treesitter.withAllGrammars
			conform-nvim
		];
	};
	xdg.configFile."nvim/lua/lang/shell.lua".source = ../../lua/lang/shell.lua;
}
