--[[ ascii font - RubiFont
▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖▗▖  ▗▖ ▗▄▖ ▗▄▄▖  ▗▄▄▖
▐▌▗▞▘▐▌    ▝▚▞▘ ▐▛▚▞▜▌▐▌ ▐▌▐▌ ▐▌▐▌   
▐▛▚▖ ▐▛▀▀▘  ▐▌  ▐▌  ▐▌▐▛▀▜▌▐▛▀▘  ▝▀▚▖
▐▌ ▐▌▐▙▄▄▖  ▐▌  ▐▌  ▐▌▐▌ ▐▌▐▌   ▗▄▄▞▘
]]

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic quickfix list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode, might not work in tmux etc.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Use hjkl to move between splits
-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
