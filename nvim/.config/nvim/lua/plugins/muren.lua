return {
  'AckslD/muren.nvim',
  keys = {
    {
      "<leader>r",
      "<cmd>lua require('muren.api').toggle_ui()<cr>",
      silent = true
    }
  },
  config = function()
    require('muren').setup({
      keys = {
        close = 'q',
        toggle_side = '<A-l>',
        toggle_options_focus = '<Tab>',
        toggle_option_under_cursor = '<CR>',
        scroll_preview_up = '<Up>',
        scroll_preview_down = '<Down>',
        do_replace = '<CR>',
        -- NOTE these are not guaranteed to work, what they do is just apply `:normal! u` vs :normal! <C-r>`
        -- on the last affected buffers so if you do some edit in these buffers in the meantime it won't do the correct thing
        do_undo = '<localleader>u',
        do_redo = '<localleader>r',
      }, -- your configuration comes here
    })
  end,
}
