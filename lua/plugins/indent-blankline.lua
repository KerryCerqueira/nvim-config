return { -- indent-blankline
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	scope = { enabled = false },
	exclude = {
		filetypes = {
			"help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble",
			"lazy", "notify", "toggleterm", "lazyterm",
		},
	},
	opts = {
		indent = {
			char = "▏",
			tab_char = "▏",
		},
	},
}
