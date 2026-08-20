return {
	"xiyaowong/transparent.nvim",
	lazy = false,
	priority = 999,

	config = function()
		require("transparent").setup({
			extra_groups = {
				"Pmenu", "PmenuThumb",
				"DiagnosticError", "DiagnosticWarn", "DiagnosticInfo", "DiagnosticHint",
			},
			exclude_groups = {
				"CursorLine", "StatusLine", "StatusLineNC",
				"NormalFloat", "FloatBorder", "FloatTitle", "YankFlash",
			},
			require("transparent").toggle(true)
		})
	end,
}
