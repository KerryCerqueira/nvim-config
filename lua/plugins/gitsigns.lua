return {
	{
		"/lewis6991/gitsigns.nvim",
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
			on_attach = function(bufnr)
				local set_keymaps = require("keymaps").set_keymaps
				local gs = require("gitsigns")
				local keymaps = {
					{
						"n",
						"]h",
						function()
							if vim.wo.diff then return "]h" end
							vim.schedule(function() gs.next_hunk() end)
							return "<Ignore>"
						end,
						"Next hunk",
						{ expr = true },
					},
					{
						"n",
						"[h",
						function()
							if vim.wo.diff then return "[h" end
							vim.schedule(function() gs.prev_hunk() end)
							return "<Ignore>"
						end,
						"Previous hunk",
						{ expr = true },
					},
					{
						"n",
						"<Leader>Gs",
						gs.stage_hunk,
						"Stage hunk",
					},
					{
						"v",
						"<Leader>Gs",
						function()
							gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")})
						end,
						"Stage selected hunk"
					},
					{
						"n",
						"<Leader>Gr",
						gs.reset_hunk,
						"Reset hunk",
					},
					{
						"v",
						"<Leader>Gr",
						function()
							gs.reset_hunk({vim.fn.line("."), vim.fn.line("v")})
						end,
						"Reset selected hunk",
					},
					{
						"n",
						"<Leader>GS",
						gs.stage_buffer,
						"Stage buffer",
					},
					{
						"n",
						"<Leader>Gu",
						gs.undo_stage_hunk,
						"Undo stage hunk",
					},
					{
						"n",
						"<Leader>GR",
						gs.reset_buffer,
						"Git reset buffer",
					},
					{
						"n",
						"<Leader>Gp",
						gs.preview_hunk,
						"Preview hunk",
					},
					{
						"n",
						"<Leader>Gb",
						function() gs.blame_line({full=true}) end,
						"Git blame line",
					},
					{
						"n",
						"<Leader>Gtb",
						gs.toggle_current_line_blame,
						"Toggle virtual text git blame",
					},
					{
						"n",
						"<Leader>Gtd",
						gs.toggle_deleted,
						"Toggle deleted"
					},
					{
						{"o", "x"},
						"ih",
						":<C-U>Gitsigns select_hunk<CR>",
						"Select hunk"
					},
				}
				set_keymaps(keymaps, bufnr)
			end,
		},
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<Leader>G"] = "+git",
			},
		},
	},
}

