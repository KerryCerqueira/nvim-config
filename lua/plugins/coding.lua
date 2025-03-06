local set_floating_diagnostics = function(bufnr)
	vim.o.updatetime = 250
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			vim.diagnostic.open_float(nil, {
				focusable = false,
				close_events = {
					"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"
				},
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			})
		end
	})
end
local set_diagnostic_icons = function()
	local diagnostic_icons = {
		Error = " ",
		Warn  = " ",
		Hint  = " ",
		Info  = " ",
	}
	for name, icon in pairs(diagnostic_icons) do
		name = "DiagnosticSign" .. name
		vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
	end
end
return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false, },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "main",
		cmd = "CopilotChat",
		opts = function()
			local user = vim.env.USER or "User"
			user = user:sub(1, 1):upper() .. user:sub(2)
			return {
				auto_insert_mode = true,
				question_header = "  " .. user .. " ",
				answer_header = "  Copilot ",
				window = {
					width = 0.4,
				},
			}
		end,
		keys = {
			{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },
			{
				"<leader>aa",
				function()
					return require("CopilotChat").toggle()
				end,
				desc = "Toggle (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>ax",
				function()
					return require("CopilotChat").reset()
				end,
				desc = "Clear (CopilotChat)",
				mode = { "n", "v" },
			},
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input)
					end
				end,
				desc = "Quick Chat (CopilotChat)",
				mode = { "n", "v" },
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")

			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat",
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
				end,
			})

			chat.setup(opts)
		end,
	},
	{
		'saghen/blink.cmp',
		dependencies = {
			-- {
			-- 	'Kaiser-Yang/blink-cmp-git',
			-- 	dependencies = { 'nvim-lua/plenary.nvim' }
			-- },
			{ "rafamadriz/friendly-snippets", },
			{ "giuxtaposition/blink-cmp-copilot", },
			{ "xzbdmw/colorful-menu.nvim", },
		},
		version = '*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "cmdline",
				['<CR>'] = { "accept", "fallback" },
			},
			cmdline = {
				keymap = {
					['<CR>'] = { "accept", "fallback" },
				},
			},
			appearance = { nerd_font_variant = "normal" },
			sources = {
				-- add git source
				default = { 'copilot', 'lsp', 'path', 'snippets', 'buffer' },
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-cmp-copilot",
						score_offset = 100,
						async = true,
					},
					-- git = {
					-- 	score_offset = 100,
					-- 	name = 'Git',
					-- 	module = 'blink-cmp-git',
					-- 	enabled = true,
					-- 	should_show_items = function()
					-- 		return vim.o.filetype == 'gitcommit' or vim.o.filetype == 'markdown'
					-- 	end,
					-- 	--- @module 'blink-cmp-git'
					-- 	--- @type blink-cmp-git.Options
					-- 	opts = {},
					-- },
				},
			},
			signature = {
				enabled = true,
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
				ghost_text = {
					enabled = true,
				},
				menu = {
					draw = {
						columns = {
							{ 'label', 'label_description', gap = 1 },
							{ "source_name" },
							{ 'kind_icon' },
						},
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
					},
				}
			}
		},
		opts_extend = { "sources.default" }
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			'saghen/blink.cmp',
			{
				"folke/neoconf.nvim",
				opts = {
					import = {
						vscode = false,
						coc = false,
						nlsp = false,
					},
				},
			},
		},
		event = { "BufReadPre", "BufNewFile" },
		keys = {
			{
				"gD",
				vim.lsp.buf.declaration,
				desc = "Go to declaration"
			},
			{
				"<Leader>ca",
				vim.lsp.buf.code_action,
				desc = "See available code actions"
			},
			{
				"<Leader>rn",
				vim.lsp.buf.rename,
				desc = "Smart rename"
			},
			{
				"<Leader>d",
				vim.diagnostic.open_float,
				desc = "Show line diagnostics"
			},
			{
				"<Leader>rs",
				":LspRestart<CR>",
				desc = "Restart LSP"
			},
		},
		opts = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
			},
			inlay_hints = {
				enabled = true,
			},
		},
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")
			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
			set_diagnostic_icons()
			set_floating_diagnostics()
			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
			vim.api.nvim_create_autocmd(
				'LspAttach',
				{
					group = vim.api.nvim_create_augroup('UserLspConfig', {}),
					callback = function(ev)
						vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
						set_floating_diagnostics(ev.buf)
					end,
				}
			)
		end,
	},
}
