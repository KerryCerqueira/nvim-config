{ pkgs, lib, ... }:

let
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
in {
	programs.neovim.plugins = [ neominimap-nvim ];
	xdg.configFile = {
		"nvim/lua/plugins/ui/neominimap-nvim.lua".source =
			../../../lua/plugins/ui/neominimap-nvim.lua;
	};
}
