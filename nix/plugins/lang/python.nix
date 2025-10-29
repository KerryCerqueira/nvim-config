{pkgs, ...}: {
  programs.neovim = {
    extraPackages = with pkgs; [
      pyright
      ruff
    ];
    plugins = with pkgs.vimPlugins; [
      neogen
      nvim-lspconfig
    ];
  };
  xdg.configFile = {
    "nvim/lua/plugins/lang/python.lua".source =
      ../../../lua/plugins/lang/python.lua;
    "nvim/lsp/pyright.lua".source =
      ../../../lsp/pyright.lua;
    "nvim/lsp/ruff.lua".source =
      ../../../lsp/ruff.lua;
  };
}
