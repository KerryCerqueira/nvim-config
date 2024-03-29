return {
	{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = { use_diagnostic_signs = true },
		keys = {
			{
				"<Leader>xx",
				"<cmd>TroubleToggle document_diagnostics<cr>",
				desc = "Document diagnostics"
			},
			{
				"<Leader>xX",
				"<cmd>TroubleToggle workspace_diagnostics<cr>",
				desc = "Workspace Diagnostics (Trouble)"
			},
			{
				"<Leader>xL",
				"<cmd>TroubleToggle loclist<cr>",
				desc = "Location List (Trouble)"
			},
			{
				"<Leader>xQ",
				"<cmd>TroubleToggle quickfix<cr>",
				desc = "Quickfix List (Trouble)"
			},
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").previous({ skip_groups = true, jump = true })
					end
				end,
				desc = "Previous trouble/quickfix item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					end
				end,
				desc = "Next trouble/quickfix item",
			},
		},
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<Leader>x"] = { name = "+trouble" },
			},
		},
	},
}
