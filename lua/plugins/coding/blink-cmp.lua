return {
	'saghen/blink.cmp',
	dependencies = {
		{ 'Kaiser-Yang/blink-cmp-git', },
		{ "rafamadriz/friendly-snippets", },
		{
			"danymat/neogen",
			opts = { snippet_engine = "nvim" },
		},
		{ "xzbdmw/colorful-menu.nvim", },
		{ "fang2hou/blink-copilot", },
	},
	opts = {
		keymap = {
			preset = "enter",
		},
		cmdline = {
			keymap = {
				["<CR>"] = { "accept", "fallback" },
			},
			completion = {
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
					end,
				},
				list = {
					selection = {
						preselect = false,
					},
				},
			},
		},
		appearance = { nerd_font_variant = "normal" },
		sources = {
			default = {
				"copilot",
				"lsp",
				"path",
				"git",
			},
			providers = {
				lsp = {
					timeout_ms = 2000,
				},
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 100,
					async = true,
				},
				git = {
					score_offset = 100,
					enabled = function()
						return vim.tbl_contains({ 'octo', 'gitcommit', 'markdown' }, vim.bo.filetype)
					end,
					name = "git",
					module = "blink-cmp-git",
					opts = {
						commit = {},
						git_centers = {
							github = {},
						},
					},
				},
			},
		},
		signature = {
			enabled = true,
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = {
				enabled = true,
			},
			list = {
				selection = {
					preselect = false,
				},
			},
			menu = {
				auto_show = true,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "source_name" },
						{ "kind_icon" },
					},
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			}
		}
	},
}
