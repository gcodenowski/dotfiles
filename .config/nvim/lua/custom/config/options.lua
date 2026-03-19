--[[
 ░██████   ░█████████  ░██████████░██████  ░██████   ░███    ░██   ░██████
 ░██   ░██  ░██     ░██     ░██      ░██   ░██   ░██  ░████   ░██  ░██   ░██
░██     ░██ ░██     ░██     ░██      ░██  ░██     ░██ ░██░██  ░██ ░██
░██     ░██ ░█████████      ░██      ░██  ░██     ░██ ░██ ░██ ░██  ░████████
░██     ░██ ░██             ░██      ░██  ░██     ░██ ░██  ░██░██         ░██
 ░██   ░██  ░██             ░██      ░██   ░██   ░██  ░██   ░████  ░██   ░██
  ░██████   ░██             ░██    ░██████  ░██████   ░██    ░███   ░██████
See ':help vim.o', ':help option-list'
]]

-- Line numbers & relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Enable the mouse, useful for resizing splits etc.
vim.o.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  See `:help 'clipboard'`
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Preview substitutions live, as you type!
vim.o.inccommand = 'split'

-- How neovim displays whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.o.confirm = true

-- Indentation management
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- Diagnostics
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
