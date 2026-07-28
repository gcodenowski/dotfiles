return { -- You can easily change to a different colorscheme.
	-- Change the name of the colorscheme plugin below, and then
	-- change the command in the config to whatever the name of that colorscheme is.
	--
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"folke/tokyonight.nvim",
	priority = 1000, -- Make sure to load this before all the other start plugins.

	config = function()
		vim.cmd.colorscheme("lunaperche")

		-- Make the comments italic
		local highlights = {
			Comment = function()
				local hl = vim.api.nvim_get_hl(0, { name = "Comment" })
				return { italic = true, fg = hl.fg }
			end,

			-- Set the dimmed code colour
			SnacksDim = { fg = "#0d1117" },

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

		for k, v in pairs(highlights) do
			if type(v) == "function" then
				v = v()
			end
			vim.api.nvim_set_hl(0, k, v)
		end

		-- Custom treesitter highlighting
		local ts_overrides = {
			-- keywords / control flow
			["@keyword"] = { fg = "#9d7cf5", italic = true }, -- import, export, return, if, etc.
			["@keyword.import"] = { fg = "#9d7cf5", italic = true },
			["@keyword.function"] = { fg = "#9d7cf5", italic = true },
			["@keyword.return"] = { fg = "#d670e0", italic = true },
			["@keyword.operator"] = { fg = "#4fc3e8" }, -- typeof, instanceof, as

			-- types
			["@type"] = { fg = "#4fc3e8", bold = true }, -- interfaces, type aliases
			["@type.builtin"] = { fg = "#4fc3e8", italic = true }, -- string, number, boolean
			["@type.definition"] = { fg = "#4fc3e8", bold = true },

			-- functions
			["@function"] = { fg = "#ffffff", bold = true },
			["@function.call"] = { fg = "#ffffff" },
			["@function.method"] = { fg = "#ffffff", bold = true },
			["@function.method.call"] = { fg = "#ffffff" },
			["@constructor"] = { fg = "#ff6b8b" },

			-- variables / params
			["@variable"] = { fg = "#e3f1ff" },
			["@variable.parameter"] = { fg = "#e0b054", italic = true },
			["@variable.member"] = { fg = "#5ce0ba" },
			["@property"] = { fg = "#3ecfff" },

			-- literals
			["@string"] = { fg = "#3ecfff" },
			["@number"] = { fg = "#f5da5c" },
			["@boolean"] = { fg = "#f5da5c", bold = true },
			["@constant"] = { fg = "#f5da5c" },
			["@constant.builtin"] = { fg = "#ff9d4d", bold = true },

			-- punctuation
			["@punctuation.bracket"] = { fg = "#ffffff" },
			["@punctuation.delimiter"] = { fg = "#ffffff" },
			["@operator"] = { fg = "#5cdbf0" },

			-- JSX/TSX specific
			["@tag"] = { fg = "#ff5c85" }, -- <div>, <Component> — brighter yank red
			["@tag.attribute"] = { fg = "#e0b054", italic = true }, -- prop=
			["@tag.delimiter"] = { fg = "#4fc3e8" }, -- < > </ />

			-- modules
			["@module"] = { fg = "#3ecfff", italic = true }, -- import paths
		}
		for k, v in pairs(ts_overrides) do
			vim.api.nvim_set_hl(0, k, v)
		end
	end,
}
