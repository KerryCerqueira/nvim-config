{ luaModules }: { pkgs, config, ... }:
let
	editingLuaModule = luaModules + /plugins/editing.lua;
in
{
	xdg.configFile."nvim/lua/plugins/editing.lua".source = editingLuaModule;
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			mini-ai
			mini-align
			mini-bracketed
			mini-comment
			mini-jump
			mini-pairs
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
		];
	};
}
