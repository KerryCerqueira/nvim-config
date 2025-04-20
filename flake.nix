{
	description = "Kerry Cerqueira's neovim confuguration";
	outputs = { ... }:
		{
			homeManagerModules.nvim-config = { ... }:
				{
					imports = [
						(import ./nix { flakeRoot = ./.; })
					];
				};
		};
}
