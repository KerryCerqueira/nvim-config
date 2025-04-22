{
	description = "Kerry Cerqueira's neovim configuration";
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
