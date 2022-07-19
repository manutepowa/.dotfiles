-- vim.g.onedark_style = 'warm'
-- vim.g.onedark_toggle_style_keymap = '<A-t>'
-- vim.g.onedark_italic_comment = true
-- vim.g.onedark_transparent_background = true
-- vim.g.onedark_darker_diagnostics = true
-- vim.g.onedark_hide_ending_tildes = true
-- commnet
require('onedark').setup({
  style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- Show/hide background
  term_colors = true, -- Use terminal colors
  ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
  toggle_style_key = '<leader>ts', -- Default keybinding to toggle
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },
  -- Plugins Config --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl instead of underline for diagnostics
    background = true, -- use background color for virtual text
  },
})
require('onedark').load()
