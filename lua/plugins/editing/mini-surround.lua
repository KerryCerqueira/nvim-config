if false then
	require("lazy")
	require("which-key")
end

---@type LazySpec
return {
	{
		"echasnovski/mini.surround",
		event = "BufEnter",
		opts = {
			mappings = {
				add = "<Leader>sa",
				delete = "<Leader>sd",
				find = "<Leader>sf",
				find_left = "<Leader>sF",
				highlight = "<Leader>sh",
				replace = "<Leader>sr",
				update_n_lines = "<Leader>sn",
				suffix_last = "l",
				suffix_next = "n",
			},
		},
		version = false,
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts_extend = { "spec" },
		---@type wk.Opts
		opts = {
			spec = {
				{ "<Leader>s", group = "surround" },
			},
		},
	},
}
