return {
	{ -- indentscope
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "▏",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble",
					"lazy", "mason", "notify", "toggleterm", "lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{ -- mini.map
		'echasnovski/mini.map',
		version = false,
		dependencies = {
			{
				'/lewis6991/gitsigns.nvim',
				version = false,
				opts = {
					signs = {
						add = { text = "▎" },
						change = { text = "▎" },
						delete = { text = "" },
						topdelete = { text = "" },
						changedelete = { text = "▎" },
						untracked = { text = "▎" },
					},
				},
			},
		},
		event = "BufEnter",
		keys = {
			{
				"<leader>mm",
				function()
					require("mini.map").toggle()
				end,
				desc = "Toggle minimap",
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("BufRead", {
				pattern = "*",
				callback = require("mini.map").open,
			})
		end,
		config = function()
			local map = require('mini.map')
			map.setup({
				symbols = {encode = map.gen_encode_symbols.dot("4x2")},
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.diagnostic(),
					map.gen_integration.gitsigns(),
				},
			})
		end,
	},
	{ -- mini.comment
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {enable_autocmd = false},
		},
		opts = {
			custom_commentstring = function()
				return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
	{ -- mini.surround
		'echasnovski/mini.surround',
		opts = {},
		version = false
	},
	{ -- mini.bracketed
		'echasnovski/mini.bracketed',
		opts = {},
		version = false
	},
	{ -- mini.starter
		'echasnovski/mini.starter',
		opts = {},
		version = false
	},
	{ -- mini.pairs
		'echasnovski/mini.pairs',
		version = false,
		keys = {
			{
				"<leader>up",
				function()
					local Util = require("lazy.core.util")
					vim.g.minipairs_disable = not vim.g.minipairs_disable
					if vim.g.minipairs_disable then
						Util.warn("Disabled auto pairs", { title = "Option" })
					else
						Util.info("Enabled auto pairs", { title = "Option" })
					end
				end,
				desc = "Toggle auto pairs",
			},
		},
		opts = {},
	},
	{ -- mini.trailspace
		'echasnovski/mini.trailspace',
		opts = {},
		version = false
	},
	{ -- dressing
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
}
