{ pkgs, ... }:

{
	imports = [
		./plugins
		./lang
		./lazynixcompat.nix
	];
	home.packages = with pkgs; [
		wl-clipboard
	];
	programs.neovim = {
		enable = true;
		withRuby = true;
		withNodeJs= true;
		withPython3= true;
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;
		defaultEditor = true;
		plugins = with pkgs.vimPlugins; [
			lazy-nvim
		];
		extraLuaConfig = builtins.readFile ../init.lua;
		lazyNixCompat.enable = true;
	};
	xdg.configFile = {
		"nvim/lua/options.lua".source = ../lua/options.lua;
		"nvim/lua/autocommands.lua".source = ../lua/autocommands.lua;
		"nvim/lua/keymaps.lua".source = ../lua/keymaps.lua;
		"nvim/lua/lazy-setup.lua".text = #lua
			''
				return {
					setup = function()
						require("lazy").setup({
							spec = {
								{ import = "plugins.ai" },
								{ import = "plugins.ui" },
								{ import = "plugins.coding" },
								{ import = "plugins.editing" },
								{ import = "plugins.git" },
								{ import = "lang" },
								{ import = "lazy-nix-compat" },
								{ import = "extra" },
							},
							performance = {
								reset_packpath = false,
								rtp = { reset = false, },
							},
							install = { missing = false, },
						})
					end,
				}
			'';
	};
}
