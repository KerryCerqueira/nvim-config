return {
	'stevearc/conform.nvim',
	optional = true,
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({async = true})
			end,
			desc = "Format (conform-nvim)",
		},
	},
	opts = {
		formatters = {
			prettier = {
				prepend_args = {
					"--print-width 72",
					"--prose-wrap always"
				},
			},
		},
	},
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
	end,
}
