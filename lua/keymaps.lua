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

return M
