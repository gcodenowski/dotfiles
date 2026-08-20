return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.

	config = function()
		-- Make the comments italic
		local highlights = {
			Comment = function()
				local hl = vim.api.nvim_get_hl(0, { name = "Comment" })
				return { italic = true, fg = hl.fg }
			end,

			-- Set the dimmed code colour
			SnacksDim = { fg = "#0d1117" },

			-- Cursor Line
			CursorLine = { bg = "#434343"},

			-- Yanking colour (see autocmds.lua)
			YankFlash = { bg = "#f7768e", fg = "#1a1b26", bold = true },

			-- Float windows (Mason, Lazy, etc.)
			NormalFloat = { bg = "#0d1117", fg = "#dfe4ed" },
			FloatBorder = { bg = "#0d1117", fg = "#3d5a7a" },
			FloatTitle = { bg = "#0d1117", fg = "#6b9ab8", bold = true },

			-- Window split borders
			WinSeparator = { bg = "NONE", fg = "#dfe4ed" },

			-- Statusline
			StatusLine = { bg = "#6b9ab8", fg = "#0d1117" },
			StatusLineNC = { bg = "#dfe4ed", fg = "#1a1b26" },

			-- OrgMode
			["@org.agenda.scheduled"] = { fg = '#898989'},
			["@org.keyword.done"] = { fg = '#5ce0ba'},
			["@org.keyword.todo"] = { fg = '#ffeb69'}
		}

		-- Re-apply on every colorscheme load. transparent.nvim's toggle()
		-- re-runs `colorscheme`, which resets all highlights and would
		-- otherwise wipe these custom groups.
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("custom-highlights", { clear = true }),
			callback = function()
				for k, v in pairs(highlights) do
					if type(v) == "function" then
						v = v()
					end
					vim.api.nvim_set_hl(0, k, v)
				end
			end,
		})

		vim.cmd.colorscheme("miniautumn")
	end,
}
