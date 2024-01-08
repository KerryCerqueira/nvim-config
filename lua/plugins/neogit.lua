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
			"<Leader>gd",
			"<cmd> DiffviewOpen<cr>",
			desc = "Diff against index",
		},
		{
			"<Leader>gD",
			"<cmd> DiffviewOpen HEAD<cr>",
			desc = "Diff against HEAD",
		},
		{
			"<Leader>gh",
			"<cmd> DiffviewFileHistory<cr>",
			desc = "View git file history",
		},
		{
			"<Leader>gg",
			function() require("neogit").open({ cwd = "%:p:h" }) end,
			desc = "Git status",
		},
	},
	opts = {},
}
