{ luaModules }: { pkgs, ...}:
let
  hyprLuaModule = luaModules + /plugins/lang/hypr.lua;
in {
  xdg.configFile."nvim/lua/lang/hypr.lua".source = hyprLuaModule;
  programs.neovim = {
    extraPackages = with pkgs; [
			hyprls
    ];
  };
}
