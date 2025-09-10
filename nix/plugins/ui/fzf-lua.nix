{ pkgs, ... }:

{
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			fzf-lua
		];
	};
	xdg.configFile."nvim/lua/plugins/fzf-lua.lua".source =
		../../../lua/plugins/ui/fzf-lua.lua;
}
