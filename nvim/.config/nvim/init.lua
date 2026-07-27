--[[
░██████           ░██   ░██
  ░██                   ░██
  ░██  ░████████  ░██░████████
  ░██  ░██    ░██ ░██   ░██
  ░██  ░██    ░██ ░██   ░██
  ░██  ░██    ░██ ░██   ░██
░██████░██    ░██ ░██    ░████
]]

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Load the config files
require 'config.options'
require 'config.autocmds'
require 'config.keymaps'

--  Install `lazy.nvim` plugin manager
--  See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then error('Error cloning lazy.nvim:\n' .. out) end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup {
  { import = 'plugins' }, -- importing plugins from my plugins dir
}
