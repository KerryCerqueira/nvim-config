return { -- treesitter
	"nvim-treesitter/nvim-treesitter",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	-- init = function(plugin)
	-- 	-- PERF: add nvim-treesitter queries to the rtp and its custom query
	-- 	-- predicates early This is needed because a bunch of plugins no
	-- 	-- longer `require("nvim-treesitter")`, which no longer trigger the
	-- 	-- **nvim-treeitter** module to be loaded in time. Luckily, the only
	-- 	-- things that those plugins need are the custom queries, which we
	-- 	-- make available during startup.
	-- 	require("lazy.core.loader").add_to_rtp(plugin)
	-- 	require("nvim-treesitter.query_predicates")
	-- end,
	opts = {
		ensure_installed = {
			"python", "lua", "html", "css", "bash", "bibtex", "c", "cmake",
			"cpp", "csv", "diff", "git_config", "git_rebase", "gitattributes",
			"gitcommit", "gitignore", "java", "json", "latex", "luap", "luau",
			"luadoc", "make", "markdown", "markdown_inline", "perl", "regex",
			"pymanifest", "requirements", "rust", "sql", "ssh_config", "toml",
			"tsv", "vim", "vimdoc", "xml", "yaml",
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
