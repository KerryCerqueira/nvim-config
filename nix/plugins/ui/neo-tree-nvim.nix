{ pkgs, ... }:

{
	programs.neovim.plugins = with pkgs.vimPlugins; [
		neo-tree-nvim
		image-nvim
		nui-nvim
		nvim-web-devicons
		plenary-nvim
	];
	xdg.configFile."nvim/lua/plugins/ui/neo-tree-nvim.lua".source =
		../../../lua/plugins/ui/neo-tree-nvim.lua;
}
