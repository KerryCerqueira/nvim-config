return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		opts = {
			ensure_installed = {
				"python",
				"lua",
				"html",
				"css",
				"bash",
				"bibtex",
				"c",
				"cmake",
				"cpp",
				"csv",
				"diff",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"java",
				"json",
				"latex",
				"luap",
				"luau",
				"luadoc",
				"make",
				"markdown",
				"markdown_inline",
				"perl",
				"pymanifest",
				"regex",
				"requirements",
				"rust",
				"sql",
				"ssh_config",
				"toml",
				"tsv",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			highlight = { enable = true },
			indent = { enable = true },
		}
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
				["g"] = { name = "+goto" },
				["gs"] = { name = "+surround" },
				["]"] = { name = "+next" },
				["["] = { name = "+prev" },
				["<leader><tab>"] = { name = "+tabs" },
				["<leader>b"] = { name = "+buffer" },
				["<leader>c"] = { name = "+code" },
				["<leader>f"] = { name = "+file/find" },
				["<leader>g"] = { name = "+git" },
				["<leader>gh"] = { name = "+hunks" },
				["<leader>q"] = { name = "+quit/session" },
				["<leader>s"] = { name = "+search" },
				["<leader>u"] = { name = "+ui" },
				["<leader>w"] = { name = "+windows" },
				["<leader>x"] = { name = "+diagnostics/quickfix" },
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		scope = { enabled = false },
		exclude = {
			filetypes = {
				"help",
				"alpha",
				"dashboard",
				"neo-tree",
				"Trouble",
				"trouble",
				"lazy",
				"mason",
				"notify",
				"toggleterm",
				"lazyterm",
			},
		},
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
		},
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end, 
	},
	{
		'echasnovski/mini.map',
		version = false,
		config = function()
			local map = require('mini.map')
			map.setup({
				integrations = {
					map.gen_integration.builtin_search(),
					map.gen_integration.diagnostic(),
				},
			})
		end,
	},
	{ 'echasnovski/mini.comment', opts = {} ,version = false },
	{ 'echasnovski/mini.surround', opts = {}, version = false },
	{ 'echasnovski/mini.bracketed', opts = {}, version = false },
	{ 'echasnovski/mini.starter', opts = {}, version = false },
	{ '/lewis6991/gitsigns.nvim', opts = {}, version = false },
}
