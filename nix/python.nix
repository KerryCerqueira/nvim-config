{ luaModules }: { pkgs, ...}:
let
  pythonLuaModule = luaModules + /plugins/lang/python.lua;
in {
  programs.neovim = {
    extraPackages = with pkgs; [
      pyright
    ];
    plugins = with pkgs.vimPlugins; [
      iron-nvim
    ];
  };
  xdg.configFile."nvim/lua/lang/python.lua".source = pythonLuaModule;
}
