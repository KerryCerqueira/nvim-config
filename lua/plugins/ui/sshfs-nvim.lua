if false then
	require("lazy")
end

---@type LazySpec
return {
	"uhs-robert/sshfs.nvim",
	opts = {
		lead_prefix = "<leader>M",
		ui = {
			file_picker = {
				preferred_picker = "neo-tree",
			},
		},
	},
}
