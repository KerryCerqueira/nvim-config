{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
    glab
  ];
  programs.neovim = {
    extraPackages = with pkgs; [
      git
      curl
    ];
    plugins = with pkgs.vimPlugins; [
      blink-cmp
      blink-cmp-git
      blink-copilot
      colorful-menu-nvim
      copilot-lua
      friendly-snippets
      luasnip
      neogen
    ];
  };
  xdg.configFile = {
    "nvim/lua/plugins/coding/blink-cmp.lua".source =
      ../../../lua/plugins/coding/blink-cmp.lua;
    "nvim/lua/snippets" = {
      source = ../../../lua/snippets;
      recursive = true;
    };
  };
}
