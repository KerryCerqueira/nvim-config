return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async", },
	event = "BufEnter",
	keys = {
		{ "zR", require("ufo").openAllFolds, desc ="Open all folds" },
		{ "zM", require("ufo").closeAllFolds, desc ="Close all folds" },
	},
	init = function()
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		vim.o.updatetime = 800
	end,
	opts = {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "treesitter function", },
					["if"] = { query = "@function.inner", desc = "treesitter function", },
					["ac"] = { query = "@class.outer", desc = "treesitter class",},
					["ic"] = { query = "@class.inner", desc = "treesitter class", },
					["iS"] = { query = "@local.scope", query_group = "locals", desc = "language scope" },
					["aS"] = { query = "@local.scope", query_group = "locals", desc = "language scope" },
					["iP"] = { query = "@parameter.inner", desc = "treesitter parameter" },
					["aP"] = { query = "@parameter.outer", desc = "treesitter parameter" },
				},
				selection_modes = {
					['@function.outer'] = 'V',
					['@class.outer'] = 'V',
				},
			},
		},
		provider_selector = function(bufnr, filetype, buftype)
			return {'treesitter', 'indent'}
		end,
		fold_virt_text_handler = function(
			virtText,
			lnum,
			endLnum,
			width,
			truncate
		)
			local newVirtText = {}
			local suffix = (' 󰁂 %d '):format(endLnum - lnum)
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0
			for _, chunk in ipairs(virtText) do
				local chunkText = chunk[1]
				local chunkWidth = vim.fn.strdisplaywidth(chunkText)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, chunk)
				else
					chunkText = truncate(chunkText, targetWidth - curWidth)
					local hlGroup = chunk[2]
					table.insert(newVirtText, {chunkText, hlGroup})
					chunkWidth = vim.fn.strdisplaywidth(chunkText)
					if curWidth + chunkWidth < targetWidth then
						suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end
			table.insert(newVirtText, {suffix, 'MoreMsg'})
			return newVirtText
		end
	},
	config = function(_, opts)
		local ufo = require("ufo")
		ufo.setup(opts)
		vim.api.nvim_create_autocmd(
			"CursorHold",
			{
				callback = function()
					ufo.peekFoldedLinesUnderCursor()
				end,
			}
		)
	end,
}
