return {
	"nvim-neotest/neotest",
	opts = {
		adapters = {},
	},
	keys = {
		{
			"<Leader>tt",
			function() require("neotest").run.run(vim.fn.expand("%")) end,
			desc = "Run file"
		},
		{
			"<Leader>tT",
			function() require("neotest").run.run(vim.loop.cwd()) end,
			desc = "Run all Test files"
		},
		{
			"<Leader>tr",
			function() require("neotest").run.run() end,
			desc = "Run nearest"
		},
		{
			"<Leader>ts",
			function() require("neotest").summary.toggle() end,
			desc = "Toggle summary"
		},
		{
			"<Leader>to",
			function() require("neotest").output.open({ enter = true,
				auto_close = true
			}) end, desc = "Show output" },
		{
			"<Leader>tO",
			function() require("neotest").output_panel.toggle() end,
			desc = "Toggle output panel"
		},
		{
			"<Leader>tS",
			function() require("neotest").run.stop() end,
			desc = "Stop testing"
		},
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<Leader>t"] = { name = "+test" },
			},
		},
	},
}
