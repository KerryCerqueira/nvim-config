return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "RRethy/nvim-treesitter-endwise" },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		opts = {
			ensure_installed = {
				"html", "bash", "csv", "diff", "git_config", "git_rebase",
				"gitattributes", "gitcommit", "gitignore", "json", "latex",
				"markdown", "markdown_inline", "regex", "ssh_config", "toml", "tsv",
				"vim", "vimdoc", "xml", "yaml",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			endwise = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = '<CR>',
					scope_incremental = '<CR>',
					node_incremental = '<TAB>',
					node_decremental = '<S-TAB>',
				},
			},
		},
		init = function()
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		end,
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPre", "BufNewFile" },
		opts = { mode = "cursor", max_lines = 3 },
		keys = {
			{
				"\\tc",
				function()
					require("treesitter-context").toggle()
					vim.notify("Toggle treesitter context.")
				end,
				desc = "Toggle Treesitter Context",
			},
		},
	},
}
