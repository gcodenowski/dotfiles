return {
  {
    'tpope/vim-dadbod',
    lazy = true,
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      'tpope/vim-dadbod',
      'kristijanhusak/vim-dadbod-completion',
    },
    cmd = { 'DBUI', 'DBUIToggle' },
    keys = {
      { '<leader>odb', '<cmd>DBUIToggle<cr>', desc = 'Toggle DB UI' },
    },
    init = function()
      vim.g.db_ui_save_location = vim.fn.expand '~/.local/share/db_ui'
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
}
