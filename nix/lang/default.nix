{ luaModules }: { ... }:
{
	imports = [
		(import ./hyprlang.nix {inherit luaModules;})
		(import ./json.nix {inherit luaModules;})
		(import ./lua.nix {inherit luaModules;})
		(import ./markdown.nix {inherit luaModules;})
		(import ./nix.nix {inherit luaModules;})
		(import ./python.nix {inherit luaModules;})
		(import ./rust.nix {inherit luaModules;})
		(import ./shell.nix {inherit luaModules;})
		(import ./tex.nix {inherit luaModules;})
		(import ./toml.nix {inherit luaModules;})
		(import ./yaml.nix {inherit luaModules;})
	];
}
