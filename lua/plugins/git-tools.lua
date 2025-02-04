return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"sindrets/diffview.nvim",
				cmd = { "DiffviewOpen", "DiffviewOpen" },
			},
			"nvim-telescope/telescope.nvim",
		},
		cmd = "Neogit",
		keys = {
			{
				"<Leader>Gd",
				"<cmd> DiffviewOpen<cr>",
				desc = "Diff against index",
			},
			{
				"<Leader>GD",
				"<cmd> DiffviewOpen HEAD<cr>",
				desc = "Diff against HEAD",
			},
			{
				"<Leader>Gh",
				"<cmd> DiffviewFileHistory<cr>",
				desc = "View git file history",
			},
			{
				"<Leader>Gg",
				function() require("neogit").open({ cwd = "%:p:h" }) end,
				desc = "Git status",
			},
		},
		opts = {
			graph_style = "kitty",
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gs.nav_hunk("next")
					end
				end, "Next Hunk")
				map("n", "[h", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gs.nav_hunk("prev")
					end
				end, "Prev Hunk")
				map("n", "]H", function() gs.nav_hunk("last") end, "Last Hunk")
				map("n", "[H", function() gs.nav_hunk("first") end, "First Hunk")
				map({ "n", "v" }, "<leader>Ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
				map({ "n", "v" }, "<leader>Ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
				map("n", "<leader>GhS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>Ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>GhR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>Ghp", gs.preview_hunk_inline, "Preview Hunk Inline")
				map("n", "<leader>Ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>GhB", function() gs.blame() end, "Blame Buffer")
				map("n", "<leader>Ghd", gs.diffthis, "Diff This")
				map("n", "<leader>GhD", function() gs.diffthis("~") end, "Diff This ~")
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
			end,
		},
	},
}
