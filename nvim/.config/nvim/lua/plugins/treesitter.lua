return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'tsx',
        'javascript',
        'python',
        'sql',
        'java',
        'regex',
      },
      auto_install = true,
    }
    vim.treesitter.language.register('sql', 'mysql')

    vim.api.nvim_create_autocmd('FileType', {
      callback = function() pcall(vim.treesitter.start) end,
    })
  end,
}
