{pkgs, lib, ...}:
{
  # "rev": "0c0709557a5347ff7937c01b7ecab714330d3ddd",
  # "date": "2025-04-10T01:40:01-04:00",
  # "path": "/nix/store/q2a07v96xlyvca85nwa4vgijgby1rlng-neominimap.nvim",
  # "sha256": "0xkdpv7c923vyq0s0y1hzrbsw44jwxpibcrzx671is4is2ffj0z6",
  # "hash": "",
	neominimap-nvim = let
		tag = "v3.11.1";
		version  = lib.removePrefix "v" tag;
		hash = "sha256-5gPpnNCR6BiO6T+zFW/nkhCuV/4weKAB9nuIxM6+bXY=";
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
