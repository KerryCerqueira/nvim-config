{pkgs, ...}: {
  programs.neovim.plugins = [pkgs.vimPlugins.conform-nvim];
  xdg.configFile = {
    "nvim/lua/plugins/editing/conform-nvim.lua".source =
      ../../../lua/plugins/editing/conform-nvim.lua;
  };
}
