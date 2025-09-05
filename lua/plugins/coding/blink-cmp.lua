if false then
	require("lazy")
	require("blink.cmp")
end

---@type LazySpec
return {
	'saghen/blink.cmp',
	dependencies = {
		{ "rafamadriz/friendly-snippets", },
		{
			"danymat/neogen",
			opts = { snippet_engine = "nvim" },
		},
		{ "xzbdmw/colorful-menu.nvim", },
	},
	opts_extend = { "sources.default" },
	---@type blink.cmp.Config
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
					auto_show = function(_)
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
				"lsp",
				"path",
			},
			providers = {
				lsp = {
					timeout_ms = 2000,
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
			},
		},
	},
}
