{ flakeRoot }: { pkgs, config, ... }:
let
	nvimPlugDirs = config.programs.neovim.finalPackage.passthru.packpathDirs;
	nvimPackDir = pkgs.vimUtils.packDir nvimPlugDirs;
	compatModules = import ./nixcompat;
	luaModules = flakeRoot + /lua;
in {
	imports = [
		(import ./lang { inherit luaModules; })
		(import ./ui.nix { inherit luaModules; })
		(import ./coding.nix { inherit luaModules; })
		(import ./editing.nix { inherit luaModules; })
		(import ./git.nix { inherit luaModules; })
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
		extraLuaConfig = builtins.readFile (flakeRoot + /init.lua);
	};
	xdg.configFile = {
		"nvim/lua/options.lua".source = luaModules + /options.lua;
		"nvim/lua/autocommands.lua".source = luaModules + /autocommands.lua;
		"nvim/lua/keymaps.lua".source = luaModules + /keymaps.lua;
		"nvim/lua/lazy-setup.lua".text = #lua
			''
				return {
					setup = function()
						require("lazy").setup({
							spec = {
								{ import = "plugins" },
								{ import = "lang" },
								{ import = "nixcompat" },
								{
									"folke/lazydev.nvim",
									optional = true,
									opts = {
										library = { "${nvimPackDir}/pack/myNeovimPackages/start" },
									},
								},
							},
							dev = {
								path = "${nvimPackDir}/pack/myNeovimPackages/start",
								patterns = {""},
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
		"nvim/lua/nixcompat/mason.lua".text = compatModules.mason;
		"nvim/lua/nixcompat/treesitter.lua".text = compatModules.treesitter;
	};
}
