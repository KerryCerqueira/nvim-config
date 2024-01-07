return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
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
		highlight = { enable = true },
		indent = { enable = true },
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<C-Space>",
				node_incremental = "<C-Space>",
				scope_incremental = "<TAB>",
				node_decremental = "<S-TAB>",
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
}
