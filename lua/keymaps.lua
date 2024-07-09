local M = {}

unpack = unpack or table.unpack

M.set_keymaps = function(keymaps, bufnr)
	for _, keymap in ipairs(keymaps) do
		local mode, lhs, rhs, desc, opts = unpack(keymap)
		opts = opts or { noremap = true, silent = true }
		opts.desc = desc
		opts.buffer = bufnr
		vim.keymap.set(mode, lhs, rhs, opts)
	end
end

M.user_keymaps = {
	{ "n", "tb",
		"<cmd>botright 10sp | set wfh | terminal<CR>",
		"Open terminal window at bottom",
	},
	{ "t", "<A-h>",
		"<C-\\><C-N><C-w>h",
		"Go to the left window",
	},
	{ "t", "<A-l>",
		"<C-\\><C-N><C-w>l",
		"Go to the right window",
	},
	{ "t", "<A-j>",
		"<C-\\><C-N><C-w>j",
		"Go to the down window",
	},
	{ "t", "<A-k>",
		"<C-\\><C-N><C-w>k",
		"Go to the up window",
	},
	{ "i", "<A-h>",
		"<C-\\><C-N><C-w>h",
		"Go to the left window",
	},
	{ "i", "<A-l>",
		"<C-\\><C-N><C-w>l",
		"Go to the right window",
	},
	{ "i", "<A-j>",
		"<C-\\><C-N><C-w>j",
		"Go to the down window",
	},
	{ "i", "<A-k>",
		"<C-\\><C-N><C-w>k",
		"Go to the up window",
	},
	{ "n", "<A-h>",
		"<C-w>h",
		"Go to the left window",
	},
	{ "n", "<A-l>",
		"<C-w>l",
		"Go to the right window",
	},
	{ "n", "<A-j>",
		"<C-w>j",
		"Go to the down window",
	},
	{ "n", "<A-k>",
		"<C-w>k",
		"Go to the up window",
	},
}

return M
