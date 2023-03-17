local saga = require 'lspsaga'

saga.setup {
  preview = {
    lines_above = 0,
    lines_below = 20,
  },
  scroll_preview = {
    scroll_down = '<C-j>',
    scroll_up = '<C-k>',
  },
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = { enable = false },
  ui = {
    -- currently only round theme
    theme = 'round',
    -- this option only work in neovim 0.9
    title = true,
    colors = {
      normal_bg = 'NONE',
      title_bg = 'NONE'
    },
    -- border type can be single,double,rounded,solid,shadow.
    border = 'rounded',
  },
  request_timeout = 2000,
}
