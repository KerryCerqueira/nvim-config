return {
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
		keys = {
			{
				"<leader>gt",
				function()
					require("mini.trailspace").trim()
					require("mini.trailspace").trim_last_lines()
					vim.notify("Trimmed whitespace.")
				end,
				desc = "Trim whitespace.",
			},
		},
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
					init_selection = '<C-Space>',
					scope_incremental = '<TAB>',
					node_incremental = '<C-Space>',
					node_decremental = '<Space>',
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = { query = "@function.outer", desc = "treesitter function", },
						["if"] = { query = "@function.inner", desc = "treesitter function", },
						["ac"] = { query = "@class.outer", desc = "treesitter class",},
						["ic"] = { query = "@class.inner", desc = "treesitter class", },
						["iS"] = { query = "@local.scope", query_group = "locals", desc = "language scope" },
						["aS"] = { query = "@local.scope", query_group = "locals", desc = "language scope" },
						["iP"] = { query = "@parameter.inner", desc = "treesitter parameter" },
						["aP"] = { query = "@parameter.outer", desc = "treesitter parameter" },
					},
					selection_modes = {
						['@function.outer'] = 'V',
						['@class.outer'] = 'V',
					},
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
		"gbprod/substitute.nvim",
		dependencies = {
			"rachartier/tiny-glimmer.nvim",
			opts = {
				support = { substitute = { enabled = true, }, },
			},
		},
		event = "BufEnter",
		keys = {
			{
				"s",
				require("substitute").operator,
				desc = "subtitution operator",
				{ noremap = true},
			},
			{
				"ss",
				require("substitute").line,
				desc = "subtitute line",
				{ noremap = true},
			},
			{
				"S",
				require("substitute").eol,
				desc = "subtitute to end of line",
				{ noremap = true},
			},
			{
				"s",
				require("substitute").visual,
				desc = "subtitute visual",
				mode = "x",
				{ noremap = true},
			},
			{
				"sx",
				require("substitute.exchange").operator,
				desc = "exchange operator",
				{ noremap = true},
			},
			{
				"sxx",
				require("substitute.exchange").line,
				desc = "exchange line",
				{ noremap = true},
			},
			{
				"x",
				require("substitute.exchange").visual,
				desc = "exchange visual",
				mode = "x",
				{ noremap = true},
			},
		},
		opts = {
			yank_substituted_text = true,
			on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
			highlight_substituted_text = {
				enabled = false,
			},
		},
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
