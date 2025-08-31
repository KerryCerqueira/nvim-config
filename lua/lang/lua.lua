---@module 'lazydev'
---@module 'blink.cmp'
return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "luap", "luau", "luadoc", "lua" } },
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		---@type lazydev.Config
		opts = {},
	},
	{
		"saghen/blink.cmp",
		optional = true,
		---@type blink.cmp.Config
		opts = {
			sources = {
				per_filetype = {
					lua = {
						inherit_defaults = true,
						"lazydev",
					},
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
	},
	{
		"folke/neodev.nvim",
		enabled = false,
	},
}
