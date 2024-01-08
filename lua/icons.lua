M = {}

M.cmp_kinds = {
	Array         = " ",
	Boolean       = "󰨙 ",
	Class         = " ",
	Codeium       = "󰘦 ",
	Color         = " ",
	Control       = " ",
	Collapsed     = " ",
	Constant      = "󰏿 ",
	Constructor   = " ",
	Copilot       = " ",
	Enum          = " ",
	EnumMember    = " ",
	Event         = " ",
	Field         = " ",
	File          = " ",
	Folder        = " ",
	Function      = "󰊕 ",
	Interface     = " ",
	Key           = " ",
	Keyword       = " ",
	Method        = "󰊕 ",
	Module        = " ",
	Namespace     = "󰦮 ",
	Null          = " ",
	Number        = "󰎠 ",
	Object        = " ",
	Operator      = " ",
	Package       = " ",
	Property      = " ",
	Reference     = " ",
	Snippet       = " ",
	String        = " ",
	Struct        = "󰆼 ",
	TabNine       = "󰏚 ",
	Text          = " ",
	TypeParameter = " ",
	Unit          = " ",
	Value         = " ",
	Variable      = "󰀫 ",
}

M.lspconfig_diagnostic_icons = {
	Error = " ",
	Warn  = " ",
	Hint  = " ",
	Info  = " ",
}

M.dap = {
	Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
	Breakpoint          = " ",
	BreakpointCondition = " ",
	BreakpointRejected  = { " ", "DiagnosticError" },
	LogPoint            = ".>",
}

return M
