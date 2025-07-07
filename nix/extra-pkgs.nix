{pkgs, lib, ...}:
{
	beacon-nvim = let
		tag = "v2.0.0";
		version = lib.removePrefix "v" tag;
		hash = "sha256-w5uhTVYRgkVCbJ5wrNTKs8bwSpH+4REAr9gaZrbknH8=";
	in pkgs.vimUtils.buildVimPlugin {
			pname = "beacon.nvim";
			inherit version;
			src = pkgs.fetchFromGitHub {
				owner = "DanilaMihailov";
				repo = "beacon.nvim";
				rev = tag;
				inherit hash;
			};
		};
	neominimap-nvim = let
		tag = "v3.14.2";
		version  = lib.removePrefix "v" tag;
		hash = "sha256-XJXqduBLMtHrFSThxTmcbn3YJ+j5fIhFt1ccAVbthQs=";
	in pkgs.vimUtils.buildVimPlugin {
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
		commitDate = "2025-03-07";
		version = "unstable-" + commitDate;
		rev = "70234ad3d193a187c81cb16007100b790c9801fc";
		hash = "sha256-X/uShlNIROhcqaOOsmu2mkMuvUcNgwp010HKF0KeTdk=";
	in pkgs.vimUtils.buildVimPlugin {
			pname = "tiny-glimmer.nvim";
			inherit version;
			src = pkgs.fetchFromGitHub {
				owner = "rachartier";
				repo = "tiny-glimmer.nvim";
				inherit rev hash;
			};
			nvimSkipModules = [ "test" ];
		};
	visual-whitespace-nvim = let
		commitDate = "2025-04-14";
		version = "unstable-" + commitDate;
		rev = "99898e2c26d06c9109820236228c7ce6df86e51c";
		hash = "sha256-ofiBFp3rZnGpkaBy4WG8YLcLb+EQFlRcQv7eF3adMZM=";
	in pkgs.vimUtils.buildVimPlugin {
			pname = "visual-whitespace.nvim";
			inherit version;
			src = pkgs.fetchFromGitHub {
				owner = "mcauley-penney";
				repo = "visual-whitespace.nvim";
				inherit rev hash;
			};
		};
}
