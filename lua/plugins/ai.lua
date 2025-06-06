local user = vim.env.USER or "User"
user = user:sub(1, 1):upper() .. user:sub(2)

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = false,
			},
			filetypes = {
				markdown = true,
			},
			suggestion = {
				enabled = false,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = function()
			return {
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.4,
				},
			}
		end,
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"ravitemer/codecompanion-history.nvim"
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
			},
		},
	},
}
