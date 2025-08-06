{ pkgs, ...}:

{
	programs.neovim = {
		extraPackages = with pkgs; [
			nodePackages.prettier
			taplo
		];
		plugins = with pkgs.vimPlugins; [
			conform-nvim
			nvim-lspconfig
		];
	};
	xdg.configFile."nvim/lua/lang/toml.lua".source = ../../lua/lang/toml.lua;
}
