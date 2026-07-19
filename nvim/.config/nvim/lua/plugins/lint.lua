return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        lua = { 'luacheck' },
        python = { 'ruff' },
      }

      -- Luacheck config
      lint.linters.luacheck = {
        cmd = 'luacheck',
        stdin = true,
        args = {
          '--globals',
          'vim',
          '--',
        },
        stream = 'stdout',
        ignore_exitcode = true,
        parser = require('lint.parser').from_errorformat('%f:%l:%c: %m', {
          source = 'luacheck',
        }),
      }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if vim.bo.modifiable then lint.try_lint() end
        end,
      })
    end,
  },
}
