return {
	{
		'echasnovski/mini.ai',
		event = "BufEnter",
		opts = {},
		version = false
	},
	-- TODO: Decide on keymaps
	{
		'echasnovski/mini.align',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		'echasnovski/mini.bracketed',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		"echasnovski/mini.comment",
		version = false,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = { enable_autocmd = false },
		},
		opts = {
			custom_commentstring = function()
				local module = require("ts_context_commentstring")
				return module.calculate_commentstring() or vim.bo.commentstring
			end,
		},
	},
	{
		'echasnovski/mini.jump',
		event = "BufEnter",
		opts = {},
		version = false
	},
	{
		'echasnovski/mini.pairs',
		event = "BufEnter",
		version = false,
		keys = {
			{
				"<Leader>tp",
				function()
					vim.g.minipairs_disable = not vim.g.minipairs_disable
				end,
				desc = "Toggle auto pairs",
			},
		},
		opts = {},
	},
	{
		"echasnovski/mini.splitjoin",
		event = "BufEnter",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		event = "BufEnter",
		opts = {
			mappings = {
				add = '<Leader>sa',
				delete = '<Leader>sd',
				find = '<Leader>sf',
				find_left = '<Leader>sF',
				highlight = '<Leader>sh',
				replace = '<Leader>sr',
				update_n_lines = '<Leader>sn',
				suffix_last = 'l',
				suffix_next = 'n',
			},
		},
		version = false
	},
	{
		'echasnovski/mini.trailspace',
		event = "BufEnter",
		opts = {},
		version = false
	},
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
			vim.treesitter.language.register("bash", "kitty")
			vim.filetype.add({
				extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
				filename = {
					["vifmrc"] = "vim",
				},
				pattern = {
					[".*/waybar/config"] = "jsonc",
					[".*/kitty/.+%.conf"] = "kitty",
					[".*/hypr/.+%.conf"] = "hyprlang",
					["%.env%.[%w_.-]+"] = "sh",
				},
			})
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
