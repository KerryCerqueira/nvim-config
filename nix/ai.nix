{ pkgs, ... }:

{
	programs.neovim = {
		plugins = with pkgs.vimPlugins; [
			blink-copilot
			codecompanion-nvim
			codecompanion-history-nvim
			CopilotChat-nvim
			copilot-lua
			img-clip-nvim
			nui-nvim
			plenary-nvim
 			vectorcode-nvim
		];
	};
	xdg.configFile."nvim/lua/plugins/ai.lua".source = ../lua/plugins/ai.lua;
}
