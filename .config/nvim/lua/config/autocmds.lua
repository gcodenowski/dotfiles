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
  callback = function() vim.hl.on_yank({ higroup = 'YankFlash', timeout = 150}) end,
})
