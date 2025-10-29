{pkgs, ...}: {
  programs.neovim.plugins = with pkgs.vimPlugins; [
    copilot-lua
    nvim-treesitter.withAllGrammars
  ];
  xdg.configFile = {
    "nvim/lua/plugins/ai/copilot-lua.lua".source =
      ../../../lua/plugins/ai/copilot-lua.lua;
  };
}
