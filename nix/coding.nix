{ luaModules }: { pkgs, config, ... }:
let
	codingLuaModule = luaModules + /plugins/coding.lua;
in
{
	xdg.configFile."nvim/lua/plugins/coding.lua".source = codingLuaModule;
	programs.neovim = {
		extraLuaPackages = ps: [
			ps.tiktoken_core
		];
		extraPackages = with pkgs; [
			lynx
		];
		plugins = with pkgs.vimPlugins; [
			blink-cmp
			blink-cmp-copilot
			colorful-menu-nvim
			copilot-cmp
			CopilotChat-nvim
			copilot-lua
			friendly-snippets
			iron-nvim
			neoconf-nvim
			neogen
			nvim-lspconfig
		];
	};
}
