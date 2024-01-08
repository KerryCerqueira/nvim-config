return {
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<localLeader>l"] = { name = "+vimtex" },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "bibtex", "latex" })
			end
			if type(opts.highlight.disable) == "table" then
				vim.list_extend(opts.highlight.disable, { "latex" })
			else
				opts.highlight.disable = { "latex" }
			end
		end,
	},

	{
		"lervag/vimtex",
		lazy = false, -- lazy-loading will disable inverse search
		config = function()
			vim.api.nvim_create_autocmd({ "FileType" }, {
				group = vim.api.nvim_create_augroup(
					"lazyvim_vimtex_conceal",
					{ clear = true }
				),
				pattern = { "bib", "tex" },
				callback = function()
					vim.wo.conceallevel = 2
				end,
			})

			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
			vim.g.vimtex_quickfix_method = (
				vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
			)
			vim.g.vimtex_view_method = "zathura"
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = function(_, opts)
			opts.ensure_installed = opts.ensure_installed or {}
			vim.list_extend(opts.ensure_installed, { "texlab" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		optional = true,
		opts = {
			servers = {
				texlab = {
					keys = {
						{ "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
					},
				},
			},
		},
	},
}