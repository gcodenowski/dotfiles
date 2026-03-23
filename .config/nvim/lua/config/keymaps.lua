--[[ ascii font - Terrace
░██    ░██
░██   ░██    ░███████  ░██    ░██ ░█████████████   ░██████   ░████████   ░███████
░███████    ░██    ░██ ░██    ░██ ░██   ░██   ░██       ░██  ░██    ░██ ░██
░██   ░██   ░█████████ ░██    ░██ ░██   ░██   ░██  ░███████  ░██    ░██  ░███████
░██    ░██  ░██        ░██   ░███ ░██   ░██   ░██ ░██   ░██  ░███   ░██        ░██
░██     ░██  ░███████   ░█████░██ ░██   ░██   ░██  ░█████░██ ░██░█████   ░███████
                              ░██                            ░██
                        ░███████                             ░██
See `:help map()`
]]

-- Wrapper for ease of use
local function map(m, k, v) vim.keymap.set(m, k, v, { noremap = true, silent = true }) end

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic quickfix list
--'Open diagnostic [Q]uickfix list' })
map('n', '<leader>q', vim.diagnostic.setloclist)

-- Exit terminal mode, might not work in tmux etc.
map('t', '<Esc><Esc>', '<C-\\><C-n>')

-- Use hjkl to move between splits
-- See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>')
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

-- Go the the dashboard
map('n', '<leader>d', '<cmd>Alpha<CR>')

-- Colorscheme picker
map('n', '<leader>c', '<cmd>Telescope colorscheme<CR>')

-- See the registers
map('n', '<leader>r', '<cmd>reg<CR>')

-- Open Mason and Lazy
map('n', '<leader>m', '<cmd>Mason<CR>')
map('n', '<leader>l', '<cmd>Lazy<CR>')
