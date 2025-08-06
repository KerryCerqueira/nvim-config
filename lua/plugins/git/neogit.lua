return {
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
}
