{pkgs, lib, ...}:
{
	neominimap-nvim = let
		tag = "v3.11.1";
		version  = lib.removePrefix "v" tag;
		hash = "sha256-5TVz3ebhnc7t3bGnBu0nivSb4TVVWuupI8gxfP6FG20=";
	in
		pkgs.vimUtils.buildVimPlugin {
			pname = "neominimap.nvim";
			inherit version;
			src = pkgs.fetchFromGitHub {
				owner = "Isrothy";
				repo = "neominimap.nvim";
				rev = tag;
				inherit hash;
			};
		};
	tiny-glimmer-nvim = let
		version = "0.0.1";
		rev = "70234ad3d193a187c81cb16007100b790c9801fc";
		hash = "sha256-X/uShlNIROhcqaOOsmu2mkMuvUcNgwp010HKF0KeTdk=";
	in
		pkgs.vimUtils.buildVimPlugin {
			pname = "tiny-glimmer.nvim";
			inherit version;
			src = pkgs.fetchFromGitHub {
				owner = "rachartier";
				repo = "tiny-glimmer.nvim";
				inherit rev;
				inherit hash;
			};
			nvimSkipModules = [ "test" ];
		};
}
