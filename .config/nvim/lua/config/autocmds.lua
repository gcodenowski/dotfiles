--[[
   ░███                  ░██                                                 ░██
  ░██░██                 ░██                                                 ░██
 ░██  ░██  ░██    ░██ ░████████  ░███████   ░███████  ░█████████████   ░████████  ░███████
░█████████ ░██    ░██    ░██    ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██    ░██ ░██
░██    ░██ ░██    ░██    ░██    ░██    ░██ ░██        ░██   ░██   ░██ ░██    ░██  ░███████
░██    ░██ ░██   ░███    ░██    ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██   ░███        ░██
░██    ░██  ░█████░██     ░████  ░███████   ░███████  ░██   ░██   ░██  ░█████░██  ░███████
See ':help lua-guide-autocommands'
]]

--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Save dadbod sql query
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql' },
  callback = function() vim.keymap.set('n', '<leader>qs', ':saveas ~/.local/share/db_ui/saved_queries/', { buffer = true, desc = 'Save query' }) end,
})
