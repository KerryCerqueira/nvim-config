{
	description = "Kerry Cerqueira's neovim confuguration";
	outputs = { self, ... }@inputs:
		let
			luaModules = ./lua;
		in
			{
			homeManagerModules.nvim-config = { ... }:
				{
					imports = [
						(import ./nix/extra.nix { inherit luaModules; })
						(import ./nix/python.nix { inherit luaModules; })
					];
				};
		};
}
