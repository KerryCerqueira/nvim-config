{ luaModules, ... }: { pkgs, lib, config, ... }:
let
	editingLuaModule = luaModules + /plugins/editing.lua;
in
	{
	xdg.configFile."nvim/lua/plugins/editing.lua".source = editingLuaModule;
	programs.neovim = {
		plugins = let
			extraPkgs = (import ./extra-pkgs.nix { inherit pkgs lib; });
		in
			with pkgs.vimPlugins; [
				mini-bracketed
				mini-comment
				mini-splitjoin
				mini-surround
				mini-trailspace
				nvim-treesitter.withAllGrammars
				nvim-treesitter-context
				nvim-treesitter-endwise
				nvim-treesitter-pairs
				nvim-treesitter-textobjects
				nvim-treesitter-textsubjects
				nvim-ts-context-commentstring
				substitute-nvim
			] ++ (
			with extraPkgs; [
				visual-whitespace-nvim
			]);
	};
}
