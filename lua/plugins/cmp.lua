return {
	"hrsh7th/nvim-cmp",
	version = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			keys = {
				{
					"<tab>",
					function()
						return (
							require("luasnip").jumpable(1)
							and "<Plug>luasnip-jump-next"
							or "<tab>"
						)
					end,
					expr = true, silent = true, mode = "i",
				},
				{
					"<tab>",
					function() require("luasnip").jump(1) end,
					mode = "s"
				},
				{
					"<s-tab>",
					function() require("luasnip").jump(-1) end,
					mode = { "i", "s" }
				},
			},
		},
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		}
	},
	opts = function()
		vim.api.nvim_set_hl(
			0, "CmpGhostText",
			{ link = "Comment", default = true }
		)
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		return {
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(
					{ behavior = cmp.SelectBehavior.Insert }
				),
				["<C-p>"] = cmp.mapping.select_prev_item(
					{ behavior = cmp.SelectBehavior.Insert }
				),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<S-CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
				["<C-CR>"] = function(fallback)
				cmp.abort()
					fallback()
				end,
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				}, { { name = "buffer" }, }),
			formatting = {
				format = function(_, item)
					local icons = require("icons").cmp_kinds
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},
			experimental = {
				ghost_text = {
					hl_group = "CmpGhostText",
				},
			},
			sorting = defaults.sorting,
		}
	end,
}
