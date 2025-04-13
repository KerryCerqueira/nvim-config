{ luaModules }: { ... }:
{
	imports = [
		(import ./hypr.nix luaModules)
		(import ./json.nix luaModules)
		(import ./lua.nix luaModules)
		(import ./markdown.nix luaModules)
		(import ./nix.nix luaModules)
		(import ./python.nix luaModules)
		(import ./rust.nix luaModules)
		(import ./shell.nix luaModules)
		(import ./tex.nix luaModules)
		(import ./toml.nix luaModules)
		(import ./yaml.nix luaModules)
	];
}
