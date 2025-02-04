return {
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		init = function() vim.cmd.colorscheme("catppuccin-mocha") end,
		opts = {
			transparent_background = true,
			term_colors = true,
		},
	},
}
