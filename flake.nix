{
  description = "Kerry Cerqueira's neovim configuration";
  outputs = {...}: {
    homeManagerModules.nvim-config = {...}: {
      imports = [./nix];
    };
  };
}
