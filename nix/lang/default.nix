{ luaModules, compatModules }@modules: { ... }:
{
	imports = [
		(import ./hyprlang.nix modules)
		(import ./json.nix modules)
		(import ./lua.nix modules)
		(import ./markdown.nix modules)
		(import ./nix.nix modules)
		(import ./python.nix modules)
		(import ./rust.nix modules)
		(import ./shell.nix modules)
		(import ./tex.nix modules)
		(import ./toml.nix modules)
		(import ./yaml.nix modules)
	];
}
