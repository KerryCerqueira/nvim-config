return {
	{
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
	},
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		init = function()
			vim.opt.laststatus = 3
			vim.opt.splitkeep = "screen"
		end,
		optional = true,
		opts_extend = { "bottom", "left", "right" },
		---@module 'edgy'
		---@param opts Edgy.Config
		opts = {
			bottom = {
				{
					title = "Diagnostics",
					ft = "trouble",
					filter = function(_, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == "bottom"
							and vim.w[win].trouble.type == "split"
							and vim.w[win].trouble.relative == "editor"
							and vim.w[win].trouble.mode == "diagnostics"
							and not vim.w[win].trouble_preview
					end,
				},
				{
					title = "%{b:snacks_terminal.id}: %{b:term_title}",
					ft = "snacks_terminal",
					size = { height = 0.4 },
					filter = function(_, win)
						return vim.w[win].snacks_win
							and vim.w[win].snacks_win.position == "bottom"
							and vim.w[win].snacks_win.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				},
				{ ft = "qf", title = "QuickFix" },
				{
					ft = "markdown",
					size = { height = 20 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{
					ft = "text",
					size = { height = 20 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{
					ft = "help",
					size = { height = 20 },
					-- only show help buffers
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{
					title = "%{b:snacks_terminal.id}: %{b:term_title}",
					ft = "snacks_terminal",
					size = { height = 0.4 },
					filter = function(_, win)
						return vim.w[win].snacks_win
							and vim.w[win].snacks_win.position == "bottom"
							and vim.w[win].snacks_win.relative == "editor"
							and not vim.w[win].trouble_preview
					end,
				},
			},
			left = {
				{
					title = "LSP Defs/Refs/Decs",
					ft = "trouble",
					filter = function(_, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == "left"
							and vim.w[win].trouble.type == "split"
							and vim.w[win].trouble.relative == "editor"
							and vim.w[win].trouble.mode == "lsp"
							and not vim.w[win].trouble_preview
					end,
				},
				{
					title = "",
					ft = "trouble",
					filter = function(_, win)
						return vim.w[win].trouble
							and vim.w[win].trouble.position == "left"
							and vim.w[win].trouble.type == "split"
							and vim.w[win].trouble.relative == "editor"
							and vim.w[win].trouble.mode == "symbols"
							and not vim.w[win].trouble_preview
					end,
				},
				{
					title = "Neo-Tree Buffers",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "buffers"
					end,
					open = function()
						vim.cmd("Neotree show position=top buffers dir=%s", vim.fn.getcwd())
					end,
				},
			},
			exit_when_last = true,
		},
	},
	{
		"folke/snacks.nvim",
		dependencies = { "echasnovski/mini.basics" },
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			quickfile = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = {
				enabled = true,
				folds = {
					open = true,
					git_hl = true,
				},
			},
			styles = {
				notification = {
					wo = { wrap = true }
				},
			},
		},
		keys = {
			{
				"<leader>z",
				function() Snacks.zen() end,
				desc = "Toggle Zen Mode"
			},
			{
				"<leader>Z",
				function() Snacks.zen.zoom() end,
				desc = "Toggle Zoom"
			},
			{
				"<leader>.",
				function() Snacks.scratch() end,
				desc = "Toggle Scratch Buffer"
			},
			{
				"<leader>S",
				function() Snacks.scratch.select() end,
				desc = "Select Scratch Buffer"
			},
			{
				"<leader>nh",
				function() Snacks.notifier.show_history() end,
				desc = "Notification History"
			},
			{
				"<leader>bd",
				function() Snacks.bufdelete() end,
				desc = "Delete Buffer"
			},
			{
				"<leader>rf",
				function() Snacks.rename.rename_file() end,
				desc = "Rename File"
			},
			{
				"<leader>nd",
				function() Snacks.notifier.hide() end,
				desc = "Dismiss All Notifications"
			},
			{
				"<c-/>",
				function() Snacks.terminal() end,
				desc = "Toggle Terminal"
			},
			-- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
			-- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
			{
				"<leader>N",
				desc = "Neovim News",
				function()
					Snacks.win({
						file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
						width = 0.6,
						height = 0.6,
						wo = {
							spell = false,
							wrap = false,
							signcolumn = "yes",
							statuscolumn = " ",
							conceallevel = 3,
						},
					})
				end,
			}
		},
		init = function()
			vim.opt.tabstop = 3
			vim.opt.shiftwidth = 3
			vim.api.nvim_set_keymap(
				"t",
				"<Esc><Esc>",
				"<C-\\><C-n>",
				{noremap = true, silent = true}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-h>",
				"<C-\\><C-N><C-w>h",
				{desc = "Go to the left window", noremap = true, silent = true,}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-l>",
				"<C-\\><C-N><C-w>l",
				{desc = "Go to the right window", noremap = true, silent = true,}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-j>",
				"<C-\\><C-N><C-w>j",
				{desc = "Go to the window below", noremap = true, silent = true,}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-k>",
				"<C-\\><C-N><C-w>j",
				{desc = "Go to the window above", noremap = true, silent = true,}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-PageUp>",
				"<C-\\><C-N><C-PageUp>",
				{desc = "Go to the previous tab", noremap = true, silent = true,}
			)
			vim.api.nvim_set_keymap(
				"t",
				"<C-PageDown>",
				"<C-\\><C-N><C-PageDown>",
				{desc = "Go to the next tab", noremap = true, silent = true,}
			)
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- Setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command
					Snacks.toggle.option("spell", { name = "Spelling" }):map("\\s")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("\\w")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("\\r")
					Snacks.toggle.diagnostics():map("\\d")
					Snacks.toggle.line_number():map("\\n")
					Snacks.toggle.option("conceallevel", {
						off = 0,
						on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2
					}):map("\\L")
					Snacks.toggle.treesitter():map("\\th")
					Snacks.toggle.option("background", {
						off = "light",
						on = "dark",
						name = "Dark Background"
					}):map("\\b")
					Snacks.toggle.inlay_hints():map("\\H")
					Snacks.toggle.indent():map("\\g")
					Snacks.toggle.dim():map("\\D")
					Snacks.toggle.option("cursorline", { name = "Cursorline"}):map("\\c")
					Snacks.toggle.option("cursorcolumn", { name = "Cursorcolumn"}):map("\\C")
					Snacks.toggle.option("ignorecase", { name = "Ignore Case" }):map("\\i")
					Snacks.toggle.option("list", { name = ":set list"}):map("\\l")
					Snacks.toggle.option("hlsearch", { name = "Search Highlight"}):map("\\h")
				end,
			})
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			{"3rd/image.nvim", opts = {}},
		},
		lazy = false,
		cmd = "Neotree",
		keys = { -- lazy load commands
			{ -- netrw-like explorer
				"<leader>-",
				function()
					local reveal_file = vim.fn.expand('%:p')
					if (reveal_file == '') then
						reveal_file = vim.fn.getcwd()
					else
						local f = io.open(reveal_file, "r")
						if (f) then
							f.close(f)
						else
							reveal_file = vim.fn.getcwd()
						end
					end
					require('neo-tree.command').execute({
						action = "focus",
						toggle = true,
						source = "filesystem",
						position = "float",
						reveal_file = reveal_file,
						reveal_force_cwd = true,
					})
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{ -- buffers
				"<leader>fb",
				function()
					require('neo-tree.command').execute({
						action = "focus",
						source = "buffers",
						-- position = "float",
					})
				end,
			},
		},
		opts = {
			sources = {
				"filesystem",
				"buffers",
			},
			close_if_last_window = false,
			popup_border_style = "rounded",
			enable_diagnostics = true,
			open_files_do_not_replace_types = { "terminal", "trouble", "Trouble", "Outline", "qf", "edgy" },
			default_component_configs = {
				container = {
					enable_character_fade = true
				},
				type = {
					enabled = true,
					required_width = 88, -- min width of window required to show this column
				},
				last_modified = {
					enabled = true,
					required_width = 64, -- min width of window required to show this column
				},
				created = {
					enabled = true,
					required_width = 88, -- min width of window required to show this column
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
			},
			filesystem = {
				hijack_netrw_behavior = "open_current",
				filtered_items = {
					visible = true,
					hide_dotfiles = true,
					hide_gitignored = true,
					always_show = { ".gitignore" },
				},
				follow_current_file = {
					enabled = true,
				},
				window = {
					mappings = {
						["-"] = "navigate_up",
					},
				},
			},
			buffers = {
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				group_empty_dirs = true,
				show_unloaded = true,
			},
		},
		-- This should work but doesn't.
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "neo-tree-preview",
				callback = function()
					vim.opt_local.foldmethod = "manual"
				end,
			})
		end,
	},
	{
		'echasnovski/mini.basics',
		lazy = true,
		opts = {
			extra_ui = true,
			mappings = {
				windows = true,
			},
			autocommands = { relnum_in_visual_mode = true, },
		},
		version = false
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"arkav/lualine-lsp-progress",
			"AndreM222/copilot-lualine",
		},
		event = "VeryLazy",
		init = function()
			vim.g.lualine_laststatus = vim.o.laststatus
			if vim.fn.argc(-1) > 0 then
				-- set an empty statusline till lualine loads
				vim.o.statusline = " "
			else
				-- hide the statusline on the starter page
				vim.o.laststatus = 0
			end
		end,
		opts = function()
			local lualine_require = require("lualine_require")
			lualine_require.require = require


			vim.o.laststatus = vim.g.lualine_laststatus

			return {
				options = {
					section_separators = { left = '', right = '' },
					component_separators = { left = '', right = '' },
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", },

					lualine_c = {
						"filename",
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								hint = " ",
							},
						},
						{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					},
					lualine_x = {
						"copilot",
						"lsp_progress",
						{
							"diff",
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							source = function()
								local gitsigns = vim.b.gitsigns_status_dict
								if gitsigns then
									return {
										added = gitsigns.added,
										modified = gitsigns.changed,
										removed = gitsigns.removed,
									}
								end
							end,
						},
					},
					lualine_y = {
						{ "progress", separator = " ", padding = { left = 1, right = 0 } },
						{ "location", padding = { left = 0, right = 1 } },
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = {"lazy", "quickfix", "trouble", "fzf" },
			}
		end,
	},
	{
		"3rd/image.nvim",
		event = {
			"BufReadPre *.png",
			"BufReadPre *.jpg",
			"BufReadPre *.jpeg",
			"BufReadPre *.gif",
			"BufReadPre *.webp",
			"BufReadPre *.avif"
		},
		ft = { "markdown", "vimwiki", "norg" },
		opts = {}
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		init = function() vim.cmd.colorscheme("catppuccin-mocha") end,
		opts = {
			transparent_background = true,
			term_colors = true,
		},
	},
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>bp",
				"<Cmd>BufferLineTogglePin<CR>",
				desc = "Toggle Pin"
			},
			{
				"<leader>bP",
				"<Cmd>BufferLineGroupClose ungrouped<CR>",
				desc = "Delete Non-Pinned Buffers"
			},
			{
				"<leader>br",
				"<Cmd>BufferLineCloseRight<CR>",
				desc = "Delete Buffers to the Right"
			},
			{
				"<leader>bl",
				"<Cmd>BufferLineCloseLeft<CR>",
				desc = "Delete Buffers to the Left"
			},
			{
				"<S-h>",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Prev Buffer"
			},
			{
				"<S-l>",
				"<cmd>BufferLineCycleNext<cr>",
				desc = "Next Buffer"
			},
			{
				"[b",
				"<cmd>BufferLineCyclePrev<cr>",
				desc = "Prev Buffer"
			},
			{
				"]b",
				"<cmd>BufferLineCycleNext<cr>",
				desc = "Next Buffer"
			},
			{
				"[B",
				"<cmd>BufferLineMovePrev<cr>",
				desc = "Move buffer prev"
			},
			{
				"]B",
				"<cmd>BufferLineMoveNext<cr>",
				desc = "Move buffer next"
			},
		},
		opts = {
			options = {
				close_command = function(n) require("snacks").bufdelete(n) end,
				right_mouse_command = function(n) require("snacks").bufdelete(n) end,
				diagnostics = "nvim_lsp",
				diagnostics_indicator = function(_, _, diag)
					local icons = {
						Error = " ",
						Warn  = " ",
						Hint  = " ",
						Info  = " ",
					}
					local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
					return vim.trim(ret)
				end,
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
			-- Fix bufferline when restoring a session
			vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
				callback = function()
					vim.schedule(function()
						pcall(nvim_bufferline)
					end)
				end,
			})
		end,
	},
	{ -- telescope
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"natecraddock/telescope-zf-native.nvim",
			"debugloop/telescope-undo.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"mrcjkb/telescope-manix",
			"nvim-telescope/telescope-frecency.nvim",
		},
		cmd = "Telescope",
		keys = { -- lazy load commands
			{
				"<leader>/",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Grep from cwd"
			},
			{
				"<leader>ff",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Fuzzy find in buffer"
			},
			{
				"<leader>:",
				function()
					require("telescope.builtin").command_history()
				end,
				desc = "Command history search"
			},
			{
				"<leader>fF",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Find files from cwd"
			},
			{
				"<leader>fa",
				function()
					require("telescope.builtin").autocommands()
				end,
				desc = "Search autocommands"
			},
			{
				"<leader>fc",
				function()
					require("telescope.builtin").commands()
				end,
				desc = "Search commands"
			},
			{
				"<leader>fh",
				function()
					require("telescope.builtin").help_tags()
				end,
				desc = "Search help tags"
			},
			{
				"<leader>fk",
				function()
					require("telescope.builtin").keymaps()
				end,
				desc = "Search keymaps"
			},
			{
				"<leader>fo",
				function()
					require("telescope.builtin").vim_options()
				end,
				desc = "Search vim options"
			},
			{
				"<leader>fr",
				function()
					require("telescope.builtin").oldfiles()
				end,
				desc = "Search recent files"
			},
			{
				"<leader>fR",
				function()
					require("telescope.builtin").resume()
				end,
				desc = "Resume telescope search"
			},
			{
				'<leader>f"',
				function()
					require("telescope.builtin").registers()
				end,
				desc = "Search registers"
			},
			{
				'<leader>fE',
				function()
					require("telescope.builtin").symbols()
				end,
				desc = "Search symbols"
			},
			{
				'<leader>fN',
				function()
					require("telescope").extensions.manix.manix()
				end,
				desc = "Search manix"
			},
			{
				'<leader>fN',
				function()
					require("telescope").extensions.manix.manix()
				end,
				desc = "Search manix"
			},
			{
				'<leader>fu',
				function()
					require("telescope").extensions.undo.undo()
				end,
				desc = "Search undo tree"
			},
			{
				'<leader>Gc',
				function()
					require("telescope.builtin").git_commits()
				end,
				desc = "Search git commits"
			},
		},
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = "move_selection_previous",
						["<C-j>"] = "move_selection_next",
						["<C-h>"] = "which_key",
					},
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "respect_case",
				},
				undo = {},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("zf-native")
			require("telescope").load_extension("undo")
			require("telescope").load_extension("manix")
			require("telescope").load_extension("frecency")
			--TODO: Add project picker
			--TODO: Exchnage file finders for frecency ones
		end,
	},
	---@module "neominimap.config.meta"
	{
		"Isrothy/neominimap.nvim",
		lazy = false,
		keys = {
			{ "\\mm", "<cmd>Neominimap toggle<cr>", desc = "Toggle global minimap" },
			{ "\\mw", "<cmd>Neominimap winToggle<cr>", desc = "Toggle minimap for current window" },
			{ "\\mt", "<cmd>Neominimap tabToggle<cr>", desc = "Toggle minimap for current tab" },
			{ "\\mb", "<cmd>Neominimap bufToggle<cr>", desc = "Toggle minimap for current buffer" },
			{ "<leader>mf", "<cmd>Neominimap toggleFocus<cr>", desc = "Switch focus on minimap" },
		},
		init = function()
			vim.g.neominimap = {
				auto_enable = true,
				layout = "split",
				close_if_last_window = true,
			}
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async", },
		event = "BufEnter",
		keys = {
			{ "zR", require("ufo").openAllFolds, desc ="Open all folds" },
			{ "zM", require("ufo").closeAllFolds, desc ="Close all folds" },
		},
		init = function()
			vim.o.foldlevel = 99
			vim.o.foldlevelstart = 99
			vim.o.foldenable = true
			vim.o.updatetime = 800
		end,
		opts = {
			provider_selector = function(bufnr, filetype, buftype)
				return {'treesitter', 'indent'}
			end,
			fold_virt_text_handler = function(
				virtText,
				lnum,
				endLnum,
				width,
				truncate
			)
				local newVirtText = {}
				local suffix = (' 󰁂 %d '):format(endLnum - lnum)
				local sufWidth = vim.fn.strdisplaywidth(suffix)
				local targetWidth = width - sufWidth
				local curWidth = 0
				for _, chunk in ipairs(virtText) do
					local chunkText = chunk[1]
					local chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if targetWidth > curWidth + chunkWidth then
						table.insert(newVirtText, chunk)
					else
						chunkText = truncate(chunkText, targetWidth - curWidth)
						local hlGroup = chunk[2]
						table.insert(newVirtText, {chunkText, hlGroup})
						chunkWidth = vim.fn.strdisplaywidth(chunkText)
						if curWidth + chunkWidth < targetWidth then
							suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
						end
						break
					end
					curWidth = curWidth + chunkWidth
				end
				table.insert(newVirtText, {suffix, 'MoreMsg'})
				return newVirtText
			end
		},
		config = function(_, opts)
			local ufo = require("ufo")
			ufo.setup(opts)
			vim.api.nvim_create_autocmd(
				"CursorHold",
				{
					callback = function()
						ufo.peekFoldedLinesUnderCursor()
					end,
				}
			)
		end,
	},
}
