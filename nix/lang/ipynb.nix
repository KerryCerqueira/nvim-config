{ luaModules, ... }: { pkgs, ...}:
let
	ipynbLuaModule = luaModules + /lang/ipynb.lua;
in {
	xdg.configFile."nvim/lua/lang/ipynb.lua".source = ipynbLuaModule;
	programs.neovim = {
		extraPackages = with pkgs; [
			python312Packages.jupytext
			quarto
		];
		extraPython3Packages = pyPkgs: with pyPkgs; [
			cairosvg
			jupyter-client
			kaleido
			nbformat
			pnglatex
			plotly
			pyperclip
			pillow
			requests
			websocket-client
		];
		plugins = with pkgs.vimPlugins; [
			image-nvim
			molten-nvim
			otter-nvim
			quarto-nvim
		];
	};
}
