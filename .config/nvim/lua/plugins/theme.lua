return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.

  config = function()
    vim.cmd.colorscheme 'lunaperche'

    -- Make the comments italic
    local hl = vim.api.nvim_get_hl(0, { name = 'Comment' })
    vim.api.nvim_set_hl(0, 'Comment', { italic = true, fg = hl.fg })

    -- Set the dimmed code colour
    vim.api.nvim_set_hl(0, 'SnacksDim', { fg = '#0d1117' })

    -- Yanking colour (see autocmds.lua)
    vim.api.nvim_set_hl(0, 'YankFlash', { bg = '#f7768e', fg = '#1a1b26', bold = true })

    -- Float windows (Mason, Lazy, etc.)
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#0d1117', fg = '#a9b8d0' })
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#0d1117', fg = '#3d5a7a' })
    vim.api.nvim_set_hl(0, 'FloatTitle', { bg = '#0d1117', fg = '#6b9ab8', bold = true })

    -- Window split borders
    vim.api.nvim_set_hl(0, 'WinSeparator', { bg = 'NONE', fg = '#a9b8d0' })

    -- Statusline
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = '#6b9ab8', fg = '#0d1117' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#a9b8d0', fg = '#1a1b26' })

    -- TypeScript treesitter highlighting
    local ts_overrides = {
      -- keywords / control flow
      ['@keyword'] = { fg = '#bb9af7', italic = true }, -- import, export, return, if, etc.
      ['@keyword.import'] = { fg = '#bb9af7', italic = true },
      ['@keyword.function'] = { fg = '#bb9af7', italic = true },
      ['@keyword.return'] = { fg = '#bb9af7', italic = true },
      ['@keyword.operator'] = { fg = '#6b9ab8' }, -- typeof, instanceof, as

      -- types
      ['@type'] = { fg = '#6b9ab8', bold = true }, -- interfaces, type aliases
      ['@type.builtin'] = { fg = '#6b9ab8', italic = true }, -- string, number, boolean
      ['@type.definition'] = { fg = '#6b9ab8', bold = true },

      -- functions
      ['@function'] = { fg = '#a9b8d0', bold = true },
      ['@function.call'] = { fg = '#a9b8d0' },
      ['@function.method'] = { fg = '#a9b8d0', bold = true },
      ['@function.method.call'] = { fg = '#a9b8d0' },
      ['@constructor'] = { fg = '#f7768e' },

      -- variables / params
      ['@variable'] = { fg = '#c0caf5' },
      ['@variable.parameter'] = { fg = '#e0af68', italic = true },
      ['@variable.member'] = { fg = '#c0caf5' },
      ['@property'] = { fg = '#7dcfff' },

      -- literals
      ['@string'] = { fg = '#9ece6a' },
      ['@number'] = { fg = '#ff9e64' },
      ['@boolean'] = { fg = '#ff9e64', bold = true },
      ['@constant'] = { fg = '#ff9e64' },
      ['@constant.builtin'] = { fg = '#ff9e64', bold = true },

      -- punctuation
      ['@punctuation.bracket'] = { fg = '#a9b8d0' },
      ['@punctuation.delimiter'] = { fg = '#a9b8d0' },
      ['@operator'] = { fg = '#89ddff' },

      -- JSX/TSX specific
      ['@tag'] = { fg = '#f7768e' }, -- <div>, <Component>
      ['@tag.attribute'] = { fg = '#e0af68', italic = true }, -- prop=
      ['@tag.delimiter'] = { fg = '#6b9ab8' }, -- < > </ />

      -- modules
      ['@module'] = { fg = '#7dcfff', italic = true }, -- import paths
    }

    for group, opts in pairs(ts_overrides) do
      vim.api.nvim_set_hl(0, group, opts)
    end

  end,
}
