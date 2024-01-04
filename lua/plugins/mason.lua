return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		opts = { ui = { icons = require("icons").mason_status_icons, }, },
	},
	opts = { automatic_installation = true, },
}
