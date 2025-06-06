return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			preset  = "obsidian",
			file_types = { "markdown", "norg", "rmd", "org", "quarto" },
			completions = { lsp = { enabled = true } },
		},
		ft = {
			"markdown",
			"norg",
			"rmd",
			"org",
			"quarto",
			"codecompanion",
		},
		config = function(_, opts)
			require("render-markdown").setup(opts)
			require("snacks")
				.toggle({
					name = "Render Markdown",
					get = function()
						return require("render-markdown.state").enabled
					end,
					set = function(enabled)
						local m = require("render-markdown")
						if enabled then
							m.enable()
						else
							m.disable()
						end
					end,
				})
				:map("\\M")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		optional = true,
		opts = {
			linters_by_ft = {
				markdown = { "markdownlint-cli2" },
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				marksman = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				markdown = { "prettier" },
			},
		},
	},
}
