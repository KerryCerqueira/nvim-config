return {
	{
		"mfussenegger/nvim-lint",
		config = function(_, opts)
			require("lint").linters_by_ft = opts.linters_by_ft or {}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end
	},
	{
		'stevearc/conform.nvim',
		optional = true,
		event = "BufEnter",
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format()
				end,
				desc = "Format (conform-nvim)",
			},
		},
		opts = {},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)
			local filetypes = {}
			for filetype, _ in pairs(opts.formatters_by_ft) do
				table.insert(filetypes, filetype)
			end
			vim.api.nvim_create_autocmd(
				"FileType",
				{
					group = vim.api.nvim_create_augroup(
						"conform_nvim",
						{ clear = true }
					),
					pattern = filetypes,
					callback = function()
						vim.opt_local.formatexpr = "v:lua.require'conform'.formatexpr()"
					end
				}
			)
		end
	}
}
