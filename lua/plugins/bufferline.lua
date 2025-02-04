return {
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
	}
}
