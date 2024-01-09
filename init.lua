vim.g.mapleader = " "
vim.cmd("cmap w!! w !sudo tee > /dev/null %")
vim.api.nvim_create_user_command("Xs", "mks! | xa", { force = true })
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{import = "plugins"},
	{import = "plugins.lang"},
})
vim.opt.shiftwidth = 3
vim.opt.tabstop = 3
vim.opt.signcolumn = "yes"
vim.opt.number = true
vim.opt.relativenumber = true
if vim.g.neovide then
	vim.o.guifont = "MesloLGS NF:h11"
	vim.g.neovide_transparency = 0.8
	vim.g.neovide_floating_blur_amount_x = 0
	vim.g.neovide_floating_blur_amount_y = 0
	vim.g.neovide_floating_shadow = true
	vim.g.neovide_floating_z_height = 10
	vim.g.neovide_light_angle_degrees = 45
	vim.g.neovide_light_radius = 5
end
