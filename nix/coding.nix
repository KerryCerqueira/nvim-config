{ luaModules, ... }: { pkgs, config, ... }:
let
	codingLuaModule = luaModules + /plugins/coding.lua;
in
{
	xdg.configFile."nvim/lua/plugins/coding.lua".source = codingLuaModule;
	home.packages = with pkgs; [
		gh
	];
	programs.neovim = {
		extraPackages = with pkgs; [
			git
			curl
			gh
		];
		plugins = with pkgs.vimPlugins; [
			blink-cmp
			blink-cmp-git
			colorful-menu-nvim
			friendly-snippets
			neoconf-nvim
			neogen
			nvim-lspconfig
		];
	};
}
