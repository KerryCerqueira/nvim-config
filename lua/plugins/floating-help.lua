return {
	"Tyler-Barham/floating-help.nvim",
	opts = {
		width = 110,
		height = 0.9,
		position = "C",
		border = "rounded",
	},
	config = function(_, opts)
		require("floating-help").setup(opts)
		local function cmd_abbrev(abbrev, expansion)
			vim.cmd('cabbr '
				.. abbrev
				.. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "'
				.. expansion
				.. '" : "'
				.. abbrev
				.. '")<CR>'
			)
		end
		cmd_abbrev('h',         'FloatingHelp')
		cmd_abbrev('help',      'FloatingHelp')
		cmd_abbrev('helpc',     'FloatingHelpClose')
		cmd_abbrev('helpclose', 'FloatingHelpClose')
	end,
}
