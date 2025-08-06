{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [ hyprls ];
		plugins = [ pkgs.vimPlugins.nvim-lspconfig ];
	};
	xdg.configFile."nvim/lua/lang/hyprlang.lua".source =
		../../lua/lang/hyprlang.lua;
}
