return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"debugloop/telescope-undo.nvim",
		"nvim-telescope/telescope-symbols.nvim",
		"mrcjkb/telescope-manix",
		{
			"nvim-telescope/telescope-frecency.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", },
		},
	},
	cmd = "Telescope",
	keys = { -- lazy load commands
		{
			"<leader>/",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Grep from cwd"
		},
		{
			"<leader>ff",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Fuzzy find in buffer"
		},
		{
			"<leader>:",
			function()
				require("telescope.builtin").command_history()
			end,
			desc = "Command history search"
		},
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find files from cwd"
		},
		{
			"<leader>fa",
			function()
				require("telescope.builtin").autocommands()
			end,
			desc = "Search autocommands"
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").commands()
			end,
			desc = "Search commands"
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Search help tags"
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Search keymaps"
		},
		{
			"<leader>fo",
			function()
				require("telescope.builtin").vim_options()
			end,
			desc = "Search vim options"
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Search recent files"
		},
		{
			"<leader>fR",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "Resume telescope search"
		},
		{
			'<leader>f"',
			function()
				require("telescope.builtin").registers()
			end,
			desc = "Search registers"
		},
		{
			'<leader>fE',
			function()
				require("telescope.builtin").symbols()
			end,
			desc = "Search symbols"
		},
		{
			'<leader>fN',
			function()
				require("telescope").extensions.manix.manix()
			end,
			desc = "Search manix"
		},
		{
			'<leader>fN',
			function()
				require("telescope").extensions.manix.manix()
			end,
			desc = "Search manix"
		},
		{
			'<leader>fu',
			function()
				require("telescope").extensions.undo.undo()
			end,
			desc = "Search undo tree"
		},
		{
			'<leader>Gc',
			function()
				require("telescope.builtin").git_commits()
			end,
			desc = "Search git commits"
		},
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = "move_selection_previous",
					["<C-j>"] = "move_selection_next",
					["<C-h>"] = "which_key",
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "respect_case",
			},
			undo = {},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("zf-native")
		require("telescope").load_extension("undo")
		require("telescope").load_extension("manix")
		require("telescope").load_extension("frecency")
		--TODO: Add project picker
		--TODO: Exchnage file finders for frecency ones
	end,
}
