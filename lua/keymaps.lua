return {
	setup = function()
		vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
		vim.keymap.set(
			"n",
			"<left>",
			function()
				vim.notify("Use h to move!")
			end
		)
		vim.keymap.set(
			"n",
			"<right>",
			function()
				vim.notify("Use l to move!")
			end
		)
		vim.keymap.set(
			"n",
			"<up>",
			function()
				vim.notify("Use k to move!")
			end
		)
		vim.keymap.set(
			"n",
			"<down>",
			function()
				vim.notify("Use j to move!")
			end
		)
	end,
}
