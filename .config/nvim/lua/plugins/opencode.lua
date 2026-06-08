-- Opencode integration for neovim
return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }

    vim.o.autoread = true -- Required for `vim.g.opencode_opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>ao', function() require('opencode').ask '@this: ' end, { desc = 'Ask opencode…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>so', function() require('opencode').select() end, { desc = 'Select opencode…' })

    vim.keymap.set('n', '<leader>od', function() require('opencode').prompt 'Explain @diagnostics' end, { desc = 'Explain diagnostics' })

    vim.keymap.set('x', '<leader>ox', function() local selection = vim.fn.getreg '"' end)

    vim.keymap.set('n', '<leader>os', function() require('opencode').command 'session.interrupt' end, { desc = 'Interrupt opencode' })

    vim.keymap.set('n', '<leader>ons', function() require('opencode').command 'session.new' end, { desc = 'Start a new session' })

    vim.keymap.set({ 'n', 'x' }, 'go', function() return require('opencode').operator '@this ' end, { desc = 'Add range to opencode', expr = true })
    vim.keymap.set('n', 'goo', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add line to opencode', expr = true })
  end,
}
