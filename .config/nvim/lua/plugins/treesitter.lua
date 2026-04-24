return {
  'nvim-treesitter/nvim-treesitter',
  config = function()
    vim.treesitter.language.register('sql', 'mysql')
    local filetypes = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'typescript', 'python', 'sql' }
    require('nvim-treesitter').install(filetypes)
    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function() vim.treesitter.start() end,
    })
  end,
  build = ':TSUpdate',
}
