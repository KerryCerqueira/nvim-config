{ luaModules }: { pkgs, config, ... }:
let
	uiLuaModule = luaModules + /plugins/ui.lua;
in
{
	xdg.configFile."nvim/lua/plugins/ui.lua".source = uiLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			manix
		];
		plugins = with pkgs.vimPlugins; [
			bufferline-nvim
			catppuccin-nvim
			copilot-lualine
			edgy-nvim
			image-nvim
			lualine-nvim
			lualine-lsp-progress
			trouble-nvim
			mini-basics
			mini-icons
			neo-tree-nvim
			nvim-web-devicons
			snacks-nvim
			telescope-frecency-nvim
			telescope-manix
			telescope-nvim
			telescope-symbols-nvim
			telescope-undo-nvim
			telescope-zf-native-nvim
			which-key-nvim
		];
	};
}
