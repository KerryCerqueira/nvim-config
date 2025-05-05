
return {
	{
		'jmbuhr/otter.nvim',
		ft = { "markdown", "quarto" },
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
		},
		opts = {},
	},
	{
		"quarto-dev/quarto-nvim",
		dependencies = { 'jmbuhr/otter.nvim', },
		ft = { "quarto" },
		opts = {
			lspFeatures = {
				enabled = true,
				chunks = "curly",
			},
			codeRunner = {
				enabled = true,
				default_method = "molten",
			},
		},
	},
	{
		"GCBallesteros/jupytext.nvim",
		lazy = false,
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},
	{
		"HakonHarnes/img-clip.nvim",
		ft = { "markdown", "quarto", "latex" },
		opts = {
			default = {
				dir_path = "img",
			},
			filetypes = {
				markdown = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
				quarto = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
			},
		},
		config = function(_, opts)
			require("img-clip").setup(opts)
			vim.keymap.set(
				"n",
				"<leader>ii",
				":PasteImage<cr>",
				{ desc = "insert image from clipboard" }
			)
		end,
	},
	{
		"benlubas/molten-nvim",
		dependencies = { "3rd/image.nvim" },
		ft = { "python", "markdown", "quarto" },
		keys = {
			{
				"<localleader>mi",
				"<cmd>MoltenInit<CR>",
				desc = "Initialize the plugin",
			},
			{
				"<localleader>md",
				"<cmd>MoltenDeinit<CR>",
				desc = "Stop molten",
			},
		},
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_auto_open_output = true
			vim.g.molten_auto_open_html_in_browser = true
			vim.g.molten_tick_rate = 200
			vim.api.nvim_create_autocmd(
				"User",
				{
					pattern = "MoltenInitPost",
					group = vim.api.nvim_create_augroup("MoltenInit", {}),
					callback = function(ev)
						vim.keymap.set(
							"n",
							"<localleader>r",
							":MoltenEvaluateOperator<CR>",
							{
								silent = true,
								desc = "run operator selection",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>rr",
							":MoltenEvaluateLine<CR>",
							{
								silent = true,
								desc = "evaluate line",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>ce",
							":MoltenReevaluateCell<CR>",
							{
								silent = true,
								desc = "re-evaluate cell",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"v",
							"<localleader>r",
							":<C-u>MoltenEvaluateVisual<CR>gv",
							{
								silent = true,
								desc = "evaluate visual selection",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>cd",
							":MoltenDelete<CR>",
							{
								silent = true,
								desc = "molten delete cell",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>ch",
							":MoltenHideOutput<CR>",
							{
								silent = true,
								desc = "hide output",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>cs",
							":noautocmd MoltenEnterOutput<CR>",
							{
								silent = true,
								desc = "show/enter output",
								buffer = ev.buf
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>ms",
							":noautocmd MoltenEnterOutput<CR>",
							{ silent = true, desc = "show/enter output" }
						)
						vim.keymap.set(
							"n",
							"<localleader>mp",
							":MoltenImagePopup<CR>",
							{
								silent = true,
								desc = "molten image popup"
							}
						)
						vim.keymap.set(
							"n",
							"<localleader>mb",
							":MoltenOpenInBrowser<CR>",
							{ silent = true, desc = "molten open in browser" }
						)
						vim.keymap.set(
							"n",
							"<localleader>mh",
							":MoltenHideOutput<CR>",
							{ silent = true, desc = "hide output" }
						)
					end,
				}
			)
			vim.api.nvim_create_autocmd(
				"User",
				{
					pattern = "MoltenDeinitPost",
					group = vim.api.nvim_create_augroup("MoltenDeInit", {}),
					callback = function(ev)
						vim.keymap.del("n", "<localleader>e", { buffer = ev.buf })
						vim.keymap.del("n", "<localleader>rr", { buffer = ev.buf })
						vim.keymap.del("n", "<localleader>rc", { buffer = ev.buf })
						vim.keymap.del("v", "<localleader>r", { buffer = ev.buf })
						vim.keymap.del("n", "<localleader>rd", { buffer = ev.buf })
						vim.keymap.del("n", "<localleader>oh", { buffer = ev.buf })
						vim.keymap.del("n", "<localleader>os", { buffer = ev.buf })
					end,
				}
			)
		end,
	},
}
