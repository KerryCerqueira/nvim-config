{pkgs, lib, ...}: let
	tag = "v3.11.1";
	version  = lib.removePrefix "v" tag;

	neominimap-nvim = pkgs.vimUtils.buildVimPlugin {
		pname = "neominimap.nvim";
		inherit version;
		src = pkgs.fetchFromGitHub {
			owner = "Isrothy";
			repo = "neominimap.nvim";
			rev = tag;
			hash = "sha256-5TVz3ebhnc7t3bGnBu0nivSb4TVVWuupI8gxfP6FG20=";
		};
	};
in {
	programs.neovim.plugins = [neominimap-nvim];
}
