return {
	{
		"Vigemus/iron.nvim",
		keys = {
			{
				"<Leader>rr",
				":IronRepl<CR>",
				desc = "Start REPL"
			},
			{
				"<Leader>rh",
				":IronReplHere<CR>",
				desc = "Open REPL in current buffer"
			},
		},
		opts = {
			config = {
				highlight_last = "IronLastSent",
				scratch_repl = true,
				close_window_on_exit = true,
				repl_definition = {
					sh = {
						command = {"zsh"}
					},
				},
				repl_open_cmd = function(bufnr)
					vim.api.nvim_set_option_value("filetype", "iron", { buf = bufnr })
					return require("iron.view").split.vertical.botright(40)(bufnr)
				end,
			},
			keymaps = {
				send_file = "<Leader>rf",
				send_motion = "<Leader>rs",
				visual_send = "<Leader>rs",
				mark_motion = "<Leader>rm",
				mark_visual = "<Leader>rm",
				remove_mark = "<Leader>rd",
				cr = "<Leader>r<CR>",
				exit = "<Leader>rq",
				clear = "<Leader>rR",
			},
			highlight = {
				italic = true
			},
			ignore_blank_lines = true,
		},
		config = function(_, opts)
			local iron = require("iron.core")
			iron.setup(opts)
		end,
	},
	{
		"folke/edgy.nvim",
		optional = true,
		opts = {
			right = {
				{
					title = "Iron",
					ft = "iron",
					size = { width = 0.4 },
					filter = function(buf)
						return require("iron.lowlevel").repl_exists({ bufnr = buf })
					end,
				},
			},
		},
	}
}
