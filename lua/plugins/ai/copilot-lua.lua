if false then
	require("lazy")
	require("blink.cmp")
end

---@type LazySpec
return {
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		cmd = "Copilot",
		opts = {
			panel = {
				enabled = false,
			},
			filetypes = {
				markdown = true,
			},
			suggestion = {
				enabled = false,
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = {
			{ "fang2hou/blink-copilot" },
		},
		optional = true,
		opts_extend = { "sources.default" },
		---@type blink.cmp.Config
		opts = {
			sources = {
				default = {
					"copilot",
				},
				providers = {
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},
		},
	},
}
