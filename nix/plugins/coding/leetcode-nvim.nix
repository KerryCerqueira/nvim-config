{pkgs, ...}: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      leetcode-nvim
      nui-nvim
      plenary-nvim
    ];
  };
  xdg.configFile = {
    "nvim/lua/plugins/coding/leetcode-nvim.lua".source =
      ../../../lua/plugins/coding/leetcode-nvim.lua;
  };
}
