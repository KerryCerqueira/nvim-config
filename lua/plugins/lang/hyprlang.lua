return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				hyprls = {},
			},
		},
		init = function()
			vim.filetype.add({
				pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
			})
		end
	},
}
