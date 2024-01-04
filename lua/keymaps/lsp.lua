local M = {}

local telescope = require("telescope.builtin")

M.common = {
	{ "n", "gR",
		"<cmd>Telescope lsp_references<CR>",
		"Show LSP references"
	},
	{ "n", "gD",
		vim.lsp.buf.declaration,
		"Go to declaration"
	},
	{ "n", "gd",
		function() telescope.lsp_definitions() end,
		"Show LSP definition at cursor"
	},
	{ "n", "gi",
		function() telescope.lsp_implementations() end,
		"Show LSP implementations"
	},
	{ "n", "gt",
		function() telescope.lsp_type_definitions() end,
		"Show LSP type definitions"
	},
	{ { "n", "v" },
		"<leader>ca",
		vim.lsp.buf.code_action,
		"See available code actions"
	},
	{ "n", "<leader>rn",
		vim.lsp.buf.rename,
		"Smart rename"
	},
	{ "n", "<leader>D",
		function() telescope.diagnostics() end,
		"Show buffer diagnostics"
	},
	{ "n", "<leader>d",
		vim.diagnostic.open_float,
		"Show line diagnostics"
	},
	{ "n", "[d",
		vim.diagnostic.goto_prev,
		"Go to previous diagnostic"
	},
	{ "n", "]d",
		vim.diagnostic.goto_next,
		"Go to next diagnostic"
	},
	{ "n", "K",
		vim.lsp.buf.hover,
		"Show documentation at cursor"
	},
	{ "n", "<leader>rs",
		":LspRestart<CR>",
		"Restart LSP"
	},
}

return M
