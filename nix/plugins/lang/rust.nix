{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    rustaceanvim
    crates-nvim
  ];
  xdg.configFile = {
    "nvim/lua/plugins/lang/rust.lua".source =
      ../../../lua/plugins/lang/rust.lua;
    "nvim/ftplugin/rust.lua".source =
      ../../../ftplugin/rust.lua;
  };
}
