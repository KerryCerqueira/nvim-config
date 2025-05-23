return {
  setup = function()
    vim.g.mapleader = " "
    vim.g.maplocalleader = ","
    vim.opt.number = true
    vim.opt.mouse = "a"
    vim.opt.showmode = false
    vim.opt.breakindent = true
    vim.opt.undofile = true
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.signcolumn = "yes"
    vim.opt.updatetime = 800
    vim.opt.timeoutlen = 300
    vim.opt.splitright = true
    vim.opt.splitbelow = true
    vim.opt.cursorline = true
    vim.opt.scrolloff = 10
    vim.opt.confirm = true
  end,
}
