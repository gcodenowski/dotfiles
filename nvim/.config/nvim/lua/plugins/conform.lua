-- Autoformat

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,

		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff" },
			typescript = { "prettier" },
			javascript = { "prettier" },
			yaml = { "prettier" },
			json = { "fixjson" },
			jsonc = { "fixjson" },
			cpp = { "clang-format" },
			zsh = { "shfmt" }, -- My modular shell config files
			sh = { "shfmt" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
