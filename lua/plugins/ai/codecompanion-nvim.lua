local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)

return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"ravitemer/codecompanion-history.nvim",
		"nvim-treesitter/nvim-treesitter",
		{
			"Davidyz/VectorCode",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	keys = {
		{
			"<Leader>aa",
			"<cmd>CodeCompanionChat Toggle<cr>",
			desc = "Open AI chat"
		},
		{
			"<Leader>ah",
			"<cmd>CodeCompanionHistory<cr>",
			desc = "Open AI chat history"
		},
		{
			"ga",
			"<cmd>CodeCompanionChat Add<cr>",
			mode = "v",
			desc = "Add visual selection to AI chat"
		},
		{
			"<C-a>",
			"<cmd>CodeCompanionActions<cr>",
			desc = "Open AI actions"
		},
	},
	init = function()
		vim.cmd([[cab cc CodeCompanion]])
	end,
	opts = {
		display = {
			chat = {
				window = {
					opts = {
						number = false,
						relativenumber = false,
					},
				},
			},
		},
		strategies = {
			chat = {
				keymaps = {
					stop = {
						modes = {
							n = "<C-c>",
							i = "<C-c>",
						},
						description = "Cancel request",
					},
				},
				roles = {
					llm = function(adapter)
						return "  (" .. adapter.formatted_name .. ")"
					end,
					user = "  " .. user,
				},
			},
		},
		extensions = {
			history = {
				enabled = true,
				opts = {
					keymap = "<Leader>ah",
					save_chat_keymap = "<Leader>as",
					auto_save = true,
					expiration_days = 0,
					picker = "telescope",
					auto_generate_title = true,
					title_generation_opts = {
						adapter = nil,
						model = nil,
					},
					continue_last_chat = false,
					delete_on_clearing_chat = false,
					dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
					enable_logging = false,
				},
			},
			vectorcode = {
				opts = {
					add_tool = true,
				},
			},
		},
	},
}
