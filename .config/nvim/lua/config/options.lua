--[[
  ░██████                 ░██    ░██
 ░██   ░██                ░██
░██     ░██ ░████████  ░████████ ░██ ░███████  ░████████   ░███████
░██     ░██ ░██    ░██    ░██    ░██░██    ░██ ░██    ░██ ░██
░██     ░██ ░██    ░██    ░██    ░██░██    ░██ ░██    ░██  ░███████
 ░██   ░██  ░███   ░██    ░██    ░██░██    ░██ ░██    ░██        ░██
  ░██████   ░██░█████      ░████ ░██ ░███████  ░██    ░██  ░███████
            ░██
            ░██
See ':help vim.o', ':help option-list'
]]

local options = {
  number = true,
  relativenumber = true, -- line numbering
  mouse = 'a',
  showmode = true, -- it's already in the status line
  breakindent = true,
  undofile = true, -- undo history
  ignorecase = true,
  smartcase = true, -- smart case-insensitive searching
  signcolumn = 'yes', -- keep on by default
  updatetime = 250,
  timeoutlen = 300,
  splitright = true,
  splitbelow = true, -- how new splits should be opened
  inccommand = 'split', -- live substitution preview!
  cursorline = true, -- highlights current line
  scrolloff = 10, -- min number of screen lines above and below the cursor
  confirm = true, -- ask before quitting without saving

  -- Indentation
  shiftwidth = 4,
  softtabstop = 2,
  expandtab = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- How neovim displays whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Diagnostics
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}
