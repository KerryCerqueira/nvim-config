{ luaModules }: { pkgs, config, ... }:
let
	gitLuaModule = luaModules + /plugins/git.lua;
in
{
	xdg.configFile."nvim/lua/plugins/git.lua".source = gitLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			gh
		];
		plugins = with pkgs.vimPlugins; [
			neogit
			diffview-nvim
			gitsigns-nvim
			telescope-nvim
		];
	};
}
