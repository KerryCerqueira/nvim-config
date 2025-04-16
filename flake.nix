{
	description = "Kerry Cerqueira's neovim confuguration";
	outputs = { ... }:
		let
			luaModules = ./lua;
		in
			{
			homeManagerModules.nvim-config = { ... }:
				{
					imports = [
						(import ./nix { inherit luaModules; })
					];
				};
		};
}
