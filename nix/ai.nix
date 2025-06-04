{ luaModules, ... }: { pkgs, lib, config, ... }:
let
	editingLuaModule = luaModules + /plugins/editing.lua;
in
	{
	xdg.configFile."nvim/lua/plugins/editing.lua".source = editingLuaModule;
	programs.neovim = {
		extraLuaPackages = ps: [
			ps.tiktoken_core
		];
		extraPackages = with pkgs; [
			lynx
		];
		plugins = with pkgs.vimPlugins; [
			avante-nvim
			blink-cmp-avante
			blink-copilot
			CopilotChat-nvim
			copilot-lua
			copilot-lualine
			dressing-nvim
			img-clip-nvim
			nui-nvim
			plenary-nvim
		];
	};
}
