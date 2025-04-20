{ luaModules }: { pkgs, lib, config, ... }:
let
	uiLuaModule = luaModules + /plugins/ui.lua;
in
{
	xdg.configFile."nvim/lua/plugins/ui.lua".source = uiLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			manix
		];
		plugins = let
			extraPkgs = (import ./extra-pkgs.nix { inherit pkgs lib; });
		in
			with pkgs.vimPlugins; [
			bufferline-nvim
			catppuccin-nvim
			edgy-nvim
			image-nvim
			lualine-nvim
			lualine-lsp-progress
			trouble-nvim
			mini-basics
			mini-icons
			neo-tree-nvim
			nvim-ufo
			nvim-web-devicons
			promise-async
			snacks-nvim
			telescope-frecency-nvim
			telescope-manix
			telescope-nvim
			telescope-symbols-nvim
			telescope-undo-nvim
			telescope-zf-native-nvim
			which-key-nvim
		] ++ (with extraPkgs; [
			neominimap-nvim
			tiny-glimmer-nvim
		]);
	};
}
