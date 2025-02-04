return {
	{
		'echasnovski/mini.ai',
		event = "BufEnter",
		opts = {},
		version = false
	},
	-- TODO: Decide on keymaps
	{
		'echasnovski/mini.align',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		'echasnovski/mini.basics',
		lazy = true,
		opts = {
			extra_ui = true,
			mappings = {
				windows = true,
			},
			autocommands = { relnum_in_visual_mode = true, },
		},
		version = false
	},
	{
		'echasnovski/mini.bracketed',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = { enable_autocmd = false },
		},
		opts = {
			custom_commentstring = function()
				local module = require("ts_context_commentstring")
				return module.calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
	{
		'echasnovski/mini.jump',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		'echasnovski/mini.map',
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"folke/snacks.nvim",
		},
		version = false,
		event = "BufEnter",
		keys = {
			{
				"\\mm",
				function()
					require("mini.map").toggle()
				end,
				desc = "Toggle minimap",
			},
			{
				"\\mf",
				function()
					require("mini.map").toggle_focus()
				end,
				desc = "Toggle minimap focus"
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("BufRead", {
				pattern = "*",
				callback = require("mini.map").open,
			})
		end,
		opts = {
			symbols = {encode = require("mini.map").gen_encode_symbols.dot("4x2")},
			integrations = {
				require("mini.map").gen_integration.builtin_search(),
				require("mini.map").gen_integration.diagnostic(),
				require("mini.map").gen_integration.gitsigns(),
			},
		},
	},
	{
		'echasnovski/mini.pairs',
		event = "BufEnter",
		version = false,
		keys = {
			{
				"<Leader>tp",
				function()
					vim.g.minipairs_disable = not vim.g.minipairs_disable
				end,
				desc = "Toggle auto pairs",
			},
		},
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		event = "BufEnter",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		event = "BufEnter",
		opts = {
			mappings = {
				add = '<Leader>sa',
				delete = '<Leader>sd',
				find = '<Leader>sf',
				find_left = '<Leader>sF',
				highlight = '<Leader>sh',
				replace = '<Leader>sr',
				update_n_lines = '<Leader>sn',
				suffix_last = 'l',
				suffix_next = 'n',
			},
		},
		version = false
	},
	{
		'echasnovski/mini.trailspace',
		event = "BufEnter",
		opts = {},
		version = false
	},
}

