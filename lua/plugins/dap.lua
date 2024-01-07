return {
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {"mfussenegger/nvim-dap"},
		keys = {
			{
				"<Leader>du",
				function() require("dapui").toggle({ }) end,
				desc = "Dap UI"
			},
			{
				"<Leader>de",
				function() require("dapui").eval() end,
				desc = "Eval",
				mode = {"n", "v"}
			},
		},
		opts = {},
		config = function(_, opts)
			-- setup dap config by VsCode launch.json file
			-- require("dap.ext.vscode").load_launchjs()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},
	{
		"folke/which-key.nvim",
		optional = true,
		opts = {
			defaults = {
				["<Leader>d"] = { name = "+debug" },
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason.nvim",
				cmd = { "DapInstall", "DapUninstall" },
				opts = {
					automatic_installation = true,
					handlers = {},
					ensure_installed = {},
				},
			},
		},
		keys = {
			{
				"<Leader>dB",
				function()
					require("dap")
					.set_breakpoint(vim.fn.input('Breakpoint condition: '))
				end,
				desc = "Add conditional breakpoint"
			},
			{
				"<Leader>db",
				function() require("dap").toggle_breakpoint() end,
				desc = "Toggle breakpoint"
			},
			{
				"<Leader>dc",
				function() require("dap").continue() end,
				desc = "Continue"
			},
			{
				"<Leader>dC",
				function() require("dap").run_to_cursor() end,
				desc = "Run to Cursor"
			},
			{
				"<Leader>dg",
				function() require("dap").goto_() end,
				desc = "Go to line (no execute)"
			},
			{
				"<Leader>di",
				function() require("dap").step_into() end,
				desc = "Step Into"
			},
			{
				"<Leader>dj",
				function() require("dap").down() end,
				desc = "Down"
			},
			{
				"<Leader>dk",
				function() require("dap").up() end,
				desc = "Up"
			},
			{
				"<Leader>dl",
				function() require("dap").run_last() end,
				desc = "Run Last"
			},
			{
				"<Leader>do",
				function() require("dap").step_out() end,
				desc = "Step Out"
			},
			{
				"<Leader>dO",
				function() require("dap").step_over() end,
				desc = "Step Over"
			},
			{
				"<Leader>dp",
				function() require("dap").pause() end,
				desc = "Pause"
			},
			{
				"<Leader>dr",
				function() require("dap").repl.toggle() end,
				desc = "Toggle REPL"
			},
			{
				"<Leader>ds",
				function() require("dap").session() end,
				desc = "Session"
			},
			{
				"<Leader>dt",
				function() require("dap").terminate() end,
				desc = "Terminate"
			},
			{
				"<Leader>dw",
				function() require("dap.ui.widgets").hover() end,
				desc = "Widgets"
			},
		},
		config = function()
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

			for name, sign in pairs(require("icons").dap) do
				sign = type(sign) == "table" and sign or { sign }
				vim.fn.sign_define(
					"Dap" .. name,
					{
						text = sign[1],
						texthl = sign[2] or "DiagnosticInfo",
						linehl = sign[3], numhl = sign[3]
					}
				)
			end
		end,
	}
}
