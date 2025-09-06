{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [ hyprls ];
		plugins = [ pkgs.vimPlugins.nvim-lspconfig ];
	};
	xdg.configFile."nvim/lua/plugins/lang/hyprlang.lua".source =
		../../../lua/plugins/lang/hyprlang.lua;
}
