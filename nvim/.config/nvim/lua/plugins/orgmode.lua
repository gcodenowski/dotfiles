-- Clone of emacs's org mode
return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_todo_keywords = { 'TODO', 'WORKING', '|', 'DONE' },
    })

    -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}
