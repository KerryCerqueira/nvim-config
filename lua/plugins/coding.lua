return {
	{
		'saghen/blink.cmp',
		dependencies = {
			-- {
			-- 	'Kaiser-Yang/blink-cmp-git',
			-- 	dependencies = { 'nvim-lua/plenary.nvim' }
			-- },
			{ "rafamadriz/friendly-snippets", },
			{
				"danymat/neogen",
				opts = {snippet_engine = "nvim"},
			},
			{ "giuxtaposition/blink-cmp-copilot", },
			{ "xzbdmw/colorful-menu.nvim", },
		},
		version = '*',
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "enter",
			},
			cmdline = {
				keymap = {
					['<CR>'] = { "accept", "fallback" },
				},
				completion = {
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ':'
						end,
					},
					list = {
						selection = {
							preselect = false,
						},
					},
				},
			},
			appearance = { nerd_font_variant = "normal" },
			sources = {
				-- add git source
				default = { 'lsp', 'snippets', 'path', },
				providers = {
					lsp = {
						timeout_ms = 2000,
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
				list = {
					selection = {
						preselect = false,
					},
				},
				menu = {
					auto_show = true,
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
		init = function()
			vim.api.nvim_create_autocmd(
				'LspAttach',
				{
					group = vim.api.nvim_create_augroup('UserLspConfig', {}),
					callback = function(ev)
						vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
					end,
				}
			)
			vim.lsp.inlay_hint.enable(true)
		end,
		config = function(_, opts)
			local lspconfig = require("lspconfig")
			local blink = require("blink.cmp")
			for server, config in pairs(opts.servers) do
				config.capabilities = blink.get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
		end,
	},
	{
		"Vigemus/iron.nvim",
		dependencies = {
			"folke/edgy.nvim",
			optional = true,
			opts = {
				right = {
					{
						title = "Iron",
						ft = "iron",
						size = { width = 0.4 },
						filter = function(buf)
							return require("iron.lowlevel").repl_exists({ bufnr = buf })
						end,
					},
				},
			},
		},
		keys = {
			{
				"<Leader>rr",
				":IronRepl<CR>",
				desc = "Start REPL"
			},
			{
				"<Leader>rh",
				":IronReplHere<CR>",
				desc = "Open REPL in current buffer"
			},
		},
		opts = {
			config = {
				highlight_last = "IronLastSent",
				scratch_repl = true,
				close_window_on_exit = true,
				repl_definition = {
					sh = {
						command = {"zsh"}
					},
				},
				repl_open_cmd = function(bufnr)
					vim.api.nvim_set_option_value("filetype", "iron", { buf = bufnr })
					return require("iron.view").split.vertical.botright(40)(bufnr)
				end,
			},
			keymaps = {
				send_file = "<Leader>rf",
				send_motion = "<Leader>rs",
				visual_send = "<Leader>rs",
				mark_motion = "<Leader>rm",
				mark_visual = "<Leader>rm",
				remove_mark = "<Leader>rd",
				cr = "<Leader>r<CR>",
				exit = "<Leader>rq",
				clear = "<Leader>rR",
			},
			highlight = {
				italic = true
			},
			ignore_blank_lines = true,
		},
		config = function(_, opts)
			local iron = require("iron.core")
			iron.setup(opts)
		end,
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false win.position=left<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=left<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle win.position=bottom<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
		init = function()
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.HINT] = " ",
						[vim.diagnostic.severity.INFO] = " ",
					},
				},
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = false,
					severity_sort = true,
				},
				virtual_lines = {
					current_line = true,
				},
			})
		end,
		opts = {
			open_no_results = true,
		},
	},
}
