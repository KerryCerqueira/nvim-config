return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	init = function()
		vim.opt.laststatus = 3
		vim.opt.splitkeep = "screen"
	end,
	---@module 'edgy'
	---@param opts Edgy.Config
	opts = {
		bottom = {
			{ ft = "qf", title = "QuickFix" },
			{
				ft = "markdown",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "text",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				ft = "help",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				title = "%{b:snacks_terminal.id}: %{b:term_title}",
				ft = "snacks_terminal",
				size = { height = 0.4 },
				filter = function(_, win)
					return vim.w[win].snacks_win
						and vim.w[win].snacks_win.position == "bottom"
						and vim.w[win].snacks_win.relative == "editor"
						and not vim.w[win].trouble_preview
				end,
			},
		},
	},
	opts_extend = { "bottom", "left", "right" },
}
