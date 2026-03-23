return {
  'atiladefreitas/dooing',
  config = function()
    require('dooing').setup {
      calendar = {
        start_day = 'monday',
      },
    }
  end,
}
