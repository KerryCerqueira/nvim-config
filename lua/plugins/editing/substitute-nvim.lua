return {
	"gbprod/substitute.nvim",
	spec = {
		"rachartier/tiny-glimmer.nvim",
		opts = {
			support = { substitute = { enabled = true, }, },
		},
		optional = true,
	},
	event = "BufEnter",
	keys = {
		{
			"s",
			require("substitute").operator,
			desc = "subtitution operator",
			{ noremap = true},
		},
		{
			"ss",
			require("substitute").line,
			desc = "subtitute line",
			{ noremap = true},
		},
		{
			"S",
			require("substitute").eol,
			desc = "subtitute to end of line",
			{ noremap = true},
		},
		{
			"s",
			require("substitute").visual,
			desc = "subtitute visual",
			mode = "x",
			{ noremap = true},
		},
		{
			"sx",
			require("substitute.exchange").operator,
			desc = "exchange operator",
			{ noremap = true},
		},
		{
			"sxx",
			require("substitute.exchange").line,
			desc = "exchange line",
			{ noremap = true},
		},
		{
			"x",
			require("substitute.exchange").visual,
			desc = "exchange visual",
			mode = "x",
			{ noremap = true},
		},
	},
	opts = {
		yank_substituted_text = true,
		on_substitute = require("tiny-glimmer.support.substitute").substitute_cb,
		highlight_substituted_text = {
			enabled = false,
		},
	},
}
