{ luaModules }: { pkgs, ...}:
let
  hyprLuaModule = luaModules + /plugins/lang/hypr.lua;
in {
  programs.neovim = {
    extraPackages = with pkgs; [
			hyprls
    ];
  };
  xdg.configFile."nvim/lua/lang/hypr.lua".source = hyprLuaModule;
}
