{ pkgs, ... }:

{
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			nvim-treesitter.withAllGrammars
			nvim-treesitter-context
			nvim-treesitter-endwise
			nvim-treesitter-textobjects
		];
	};
	xdg.configFile = {
		"nvim/lua/plugins/ui/nvim-treesitter.lua".source =
			../../../lua/plugins/editing/nvim-treesitter.lua;
		"nvim/lua/lazy-nix-compat/nvim-treesitter.lua".text = /*lua*/ ''
			return {
				"nvim-treesitter/nvim-treesitter",
				optional = true,
				opts = {
					auto_install = false,
					ensure_installed = {},
				},
				build = nil
			}
		'';
	};
}
