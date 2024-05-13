local M = {}

local telescope = require("telescope.builtin")
local set_keymaps = require("keymaps").set_keymaps

M.common_keymaps = {
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
		"<Leader>ca",
		vim.lsp.buf.code_action,
		"See available code actions"
	},
	{ "n", "<Leader>rn",
		vim.lsp.buf.rename,
		"Smart rename"
	},
	{ "n", "<Leader>fd",
		function() telescope.diagnostics() end,
		"Show buffer diagnostics"
	},
	-- { "n", "<Leader>d",
	-- 	vim.diagnostic.open_float,
	-- 	"Show line diagnostics"
	-- },
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
	{ "n", "<Leader>rs",
		":LspRestart<CR>",
		"Restart LSP"
	},
}

M.set_floating_diagnostics = function(bufnr)
	vim.notify("Setting floating diagnostics")
	vim.o.updatetime = 250
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = {
					"BufLeave", "CursorMoved", "InsertEnter", "FocusLost"
				},
				border = 'rounded',
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
end

M.set_default_keymaps = function(bufnr)
	vim.notify("Setting default LSP keymaps")
	set_keymaps(M.common_keymaps, bufnr)
end

M.default_on_attach = function(_, bufnr)
	M.set_floating_diagnostics(bufnr)
	M.set_default_keymaps(bufnr)
end

return M

