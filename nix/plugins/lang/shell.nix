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
	xdg.configFile."nvim/lua/plugins/lang/shell.lua".source = ../../../lua/plugins/lang/shell.lua;
}
