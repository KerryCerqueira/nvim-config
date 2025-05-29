{ luaModules, ... }: { pkgs, lib, config, ... }:
let
	editingLuaModule = luaModules + /plugins/editing.lua;
in
	{
	xdg.configFile."nvim/lua/plugins/editing.lua".source = editingLuaModule;
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			avante-nvim
			blink-cmp-avante
			copilot-lua
			copilot-lualine
			dressing-nvim
			img-clip-nvim
			nui-nvim
			plenary-nvim
		];
	};
}
