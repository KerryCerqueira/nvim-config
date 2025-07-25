{ pkgs, config }@inputs:

{
	mason = import ./plugins/mason.nix inputs;
	treesitter = import ./plugins/treesitter.nix inputs;
	catppuccin = import ./plugins/catppuccin.nix inputs;
	neodev = import ./plugins/neodev.nix inputs;
}
