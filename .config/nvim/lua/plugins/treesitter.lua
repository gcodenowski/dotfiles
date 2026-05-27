return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    vim.treesitter.language.register('sql', 'mysql')
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
        'javascript',
        'python',
        'sql',
        'java',
      },
      auto_install = true,
    }
  end,
}
