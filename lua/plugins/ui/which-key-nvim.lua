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
			{ "<Leader>m", group = "minimap" },
			{ "<Leader>n", group = "notifications" },
			{ "\\m", group = "minimap" },
			{ "\\", group = "toggle" },
			{ "\\t", group = "treesitter" },
			{ "]", group = "iteration" },
			{ "[", group = "reverse iteration" },
			{ "<localleader>l", group = "vimtex" },
			{ "<localleader>m", group = "molten" },
		},
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
}
