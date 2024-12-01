return { -- neotree
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"mrbjarksen/neo-tree-diagnostics.nvim",
		{ -- nvim-window-picker
			's1n7ax/nvim-window-picker',
			version = '2.*',
			opts = {
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of, ignore window
						filetype = { 'neo-tree', "neo-tree-popup", "notify" },
						-- if the buffer type is one of, ignore window
						buftype = { 'terminal', "quickfix" },
					},
				},
			},
		},
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
		{ -- file drawer explorer
			"<leader>_",
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
					position = "left",
					reveal_file = reveal_file,
					reveal_force_cwd = true,
				})
			end,
			desc = "Toggle Neotree drawer (root dir)",
		},
		{ -- git status
			"<leader>fg",
			function()
				require('neo-tree.command').execute({
					action = "focus",
					source = "git_status",
					position = "float",
				})
			end,
			desc = "Git status",
		},
		{ -- diagnostics
			"<leader>fd",
			function()
				require('neo-tree.command').execute({
					action = "focus",
					source = "diagnostics",
					position = "float",
				})
			end,
			desc = "Show diagnostics",
		},
		{ -- document symbols
			"<leader>fs",
			function()
				require('neo-tree.command').execute({
					action = "focus",
					source = "document_symbols",
					position = "float",
				})
			end,
			desc = "List Document Symbols",
		},
		{ -- buffers
			"<leader>fb",
			function()
				require('neo-tree.command').execute({
					action = "focus",
					source = "buffers",
					position = "float",
				})
			end,
			desc = "List buffers",
		},
	},
	opts = {
		sources = {
			"filesystem",
			"buffers",
			"git_status",
			"diagnostics",
			"document_symbols",
		},
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,
		enable_normal_mode_for_inputs = false,
		open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
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
		git_status = {
			window = {
				position = "float",
			},
		},
	},
}
