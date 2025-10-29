{pkgs, ...}: {
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      neogit
      diffview-nvim
      gitsigns-nvim
      plenary-nvim
      telescope-nvim
    ];
  };
  xdg.configFile."nvim/lua/plugins/git/neogit.lua".source =
    ../../../lua/plugins/git/neogit.lua;
}
