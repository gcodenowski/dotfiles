-- Git Diff viewer in a neovim buffer
return {
	"martindur/zdiff.nvim",
	cmd = "Zdiff",
	keys = {
		{ "<leader>zd", "<cmd>Zdiff<cr>", desc = "Zdiff (uncommitted)" },
		{ "<leader>zD", "<cmd>Zdiff main<cr>", desc = "Zdiff (vs main)" },
	},
	opts = {
		keymaps = {
			toggle = "l"
		},
	},
}
