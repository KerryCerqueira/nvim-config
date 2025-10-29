{pkgs, ...}: {
  programs.neovim.plugins = [pkgs.vimPlugins.mini-surround];
  xdg.configFile = {
    "nvim/lua/plugins/editing/mini-surround.lua".source =
      ../../../lua/plugins/editing/mini-surround.lua;
  };
}
