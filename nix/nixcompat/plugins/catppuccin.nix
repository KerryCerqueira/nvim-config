{ pkgs, ... }:

# lua
''
return {
	"catppuccin/nvim",
	optional = true,
	dir = "${pkgs.vimPlugins.catppuccin-nvim}",
}
''
