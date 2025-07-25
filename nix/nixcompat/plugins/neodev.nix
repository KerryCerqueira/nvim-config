{ pkgs, config, ... }:

let
	nvimPlugDirs = config.programs.neovim.finalPackage.passthru.packpathDirs;
	nvimPackDir = pkgs.vimUtils.packDir nvimPlugDirs;
in # lua
''
return {
	"folke/lazydev.nvim",
	optional = true,
	opts = {
		library = { "${nvimPackDir}/pack/myNeovimPackages/start" },
	},
}
''
