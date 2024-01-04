local M = {}

M.set_keymaps = function(keymaps, bufnr)
	for keymap in keymaps do
		local mode, lhs, rhs, desc = unpack(keymap)
		vim.keymap.set(mode, lhs, rhs,
			{buffer = bufnr, noremap = true, silent = true, desc = desc}
		)
	end
end

return M
