{ pkgs, ...}:

{
	programs.neovim.plugins = with pkgs.vimPlugins; [
		rustaceanvim
		crates-nvim
	];
	xdg.configFile."nvim/lua/lang/rust.lua".source = ../../lua/lang/rust.lua;
}
