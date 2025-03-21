return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons" },
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show()
			end,
			desc = "Show Keymaps (which-key)",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
	opts = {
		preset = "modern",
		spec = {
			{ "<leader>a", group = "ai" },
			{ "<leader>b", group = "bufferline" },
			{ "<leader>f", group = "find..." },
			{ "<leader>G", group = "git" },
			{ "<Leader>x", group = "trouble" },
			{ "<Leader>s", group = "surround" },
			{ "<Leader>n", group = "notifications" },
			{ "\\", group = "toggle" },
			{ "\\t", group = "treesitter" },
			{ "]", group = "iteration" },
			{ "[", group = "reverse iteration" },
			{ "<Localleader>l", group = "vimtex" },
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}
