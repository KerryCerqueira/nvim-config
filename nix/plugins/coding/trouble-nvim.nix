{pkgs, ...}: {
  programs.neovim.plugins = [pkgs.vimPlugins.trouble-nvim];
  xdg.configFile = {
    "nvim/lua/plugins/coding/trouble-nvim.lua".source =
      ../../../lua/plugins/coding/trouble-nvim.lua;
  };
}
