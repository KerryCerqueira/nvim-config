{pkgs, ...}: {
  programs.neovim = {
    extraPackages = with pkgs; [
      bash-language-server
      fish-lsp
      shellcheck
    ];
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      conform-nvim
    ];
  };
  xdg.configFile = {
    "nvim/ftplugin/bash.lua".source =
      ../../../ftplugin/bash.lua;
    "nvim/ftplugin/sh.lua".source =
      ../../../ftplugin/sh.lua;
    "nvim/ftplugin/zsh.lua".source =
      ../../../ftplugin/zsh.lua;
    "nvim/lua/plugins/lang/shell.lua".source =
      ../../../lua/plugins/lang/shell.lua;
    "nvim/lsp/bashls.lua".source =
      ../../../lsp/bashls.lua;
    "nvim/lsp/fish_lsp.lua".source =
      ../../../lsp/fish_lsp.lua;
  };
}
