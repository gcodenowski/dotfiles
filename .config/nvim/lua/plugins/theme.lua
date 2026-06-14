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
  end,
}
