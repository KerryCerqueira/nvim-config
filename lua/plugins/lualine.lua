return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		local lualine_require = require("lualine_require")
		lualine_require.require = require


		vim.o.laststatus = vim.g.lualine_laststatus

		return {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },

				lualine_c = {
					"filename",
					{
						"diagnostics",
						symbols = {
							error = require("icons").lspconfig_diagnostic_icons.Error,
							warn = require("icons").lspconfig_diagnostic_icons.Warn,
							info = require("icons").lspconfig_diagnostic_icons.Info,
							hint = require("icons").lspconfig_diagnostic_icons.Hint,
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
				},
				lualine_x = {
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "neo-tree", "lazy", "quickfix", "trouble", "fzf" },
			tabline = {
				lualine_a = {{
					'tabs',
					mode = 2,
					path = 1,
					use_mode_colors = true,
				}},
				lualine_z = {{
					"buffers",
					mode = 2,
				}},
			},
			winbar = {
				lualine_a = {{
					"filename",
					path = 1,
				}},
			},
			inactive_winbar = {
				lualine_a = {{
					"filename",
					path = 1,
				}},
			}
		}
	end,
}
