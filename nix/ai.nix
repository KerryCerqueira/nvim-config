{ luaModules, ... }: { pkgs, lib, config, ... }:
let
	aiLuaModule = luaModules + /plugins/ai.lua;
in
	{
	home.packages = with pkgs; [
		vectorcode
	];
	programs.neovim = {
		extraLuaPackages = ps: [
			ps.tiktoken_core
		];
		extraPackages = with pkgs; [
			lynx
		];
		plugins = with pkgs.vimPlugins; [
			blink-copilot
			codecompanion-nvim
			codecompanion-history-nvim
			CopilotChat-nvim
			copilot-lua
			copilot-lualine
			dressing-nvim
			img-clip-nvim
			nui-nvim
			plenary-nvim
			vectorcode-nvim
		];
	};
	xdg.configFile."nvim/lua/plugins/ai.lua".source = aiLuaModule;
}
