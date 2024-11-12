return {
  'rguruprakash/simple-note.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('simple-note').setup({
      -- configuration defaults
      notes_dir = '~/notes/',
      telescope_new = '<C-n>',
      telescope_delete = '<C-x>',
      telescope_rename = '<C-r>',
    })
  end
}
