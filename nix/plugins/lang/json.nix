{pkgs, ...}: {
  programs.neovim = {
    extraPackages = with pkgs; [
      vscode-langservers-extracted
      nodePackages.prettier
    ];
    plugins = with pkgs.vimPlugins; [
      conform-nvim
      nvim-lspconfig
      SchemaStore-nvim
    ];
  };
  xdg.configFile = {
    "nvim/ftplugin/json.lua".source =
      ../../../ftplugin/json.lua;
    "nvim/lua/plugins/lang/json.lua".source =
      ../../../lua/plugins/lang/json.lua;
    "nvim/lsp/jsonls.lua".source =
      ../../../lsp/jsonls.lua;
  };
}
