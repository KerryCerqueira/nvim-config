return {
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
}
