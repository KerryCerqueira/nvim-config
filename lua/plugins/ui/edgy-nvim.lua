return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	opts_extend = { "bottom", "left", "right" },
	---@module 'edgy'
	---@param opts Edgy.Config
	opts = {
		bottom = {
			{
				title = "Diagnostics",
				ft = "trouble",
				filter = function(_, win)
					return vim.w[win].trouble
						and vim.w[win].trouble.position == "bottom"
						and vim.w[win].trouble.type == "split"
						and vim.w[win].trouble.relative == "editor"
						and vim.w[win].trouble.mode == "diagnostics"
						and not vim.w[win].trouble_preview
				end,
			},
			{
				title = "%{b:snacks_terminal.id}: %{b:term_title}",
				ft = "snacks_terminal",
				size = { height = 8 },
				filter = function(_, win)
					return vim.w[win].snacks_win
						and vim.w[win].snacks_win.position == "bottom"
						and vim.w[win].snacks_win.relative == "editor"
						and not vim.w[win].trouble_preview
				end,
			},
			{ ft = "qf", title = "QuickFix" },
			{
				ft = "markdown",
				size = { height = 12 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "text",
				size = { height = 12 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "help",
				size = { height = 12 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
		},
		left = {
			{
				title = "LSP Defs/Refs/Decs",
				ft = "trouble",
				filter = function(_, win)
					return vim.w[win].trouble
						and vim.w[win].trouble.position == "left"
						and vim.w[win].trouble.type == "split"
						and vim.w[win].trouble.relative == "editor"
						and vim.w[win].trouble.mode == "lsp"
						and not vim.w[win].trouble_preview
				end,
			},
			{
				title = "",
				ft = "trouble",
				filter = function(_, win)
					return vim.w[win].trouble
						and vim.w[win].trouble.position == "left"
						and vim.w[win].trouble.type == "split"
						and vim.w[win].trouble.relative == "editor"
						and vim.w[win].trouble.mode == "symbols"
						and not vim.w[win].trouble_preview
				end,
			},
			{
				title = "Neo-Tree Buffers",
				ft = "neo-tree",
				filter = function(buf)
					return vim.b[buf].neo_tree_source == "buffers"
				end,
				open = function()
					vim.cmd("Neotree show position=top buffers dir=%s", vim.fn.getcwd())
				end,
			},
		},
		right = {
			{
				ft = "codecompanion",
				title = "AI chat",
				size = { width = 70 },
				filter = function(_, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
		},
		exit_when_last = true,
	},
}
