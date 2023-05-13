local colors = {
  fg = '#88c0d0',
  bg = '#282C34',
}
-- LuaFormatter on
return {
  normal = {
    a = { fg = colors.fg, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg }
  },
  insert = { a = { fg = colors.fg, bg = colors.bg, gui = 'bold' } },
  visual = { a = { fg = colors.fg, bg = colors.bg, gui = 'bold' } },
  command = { a = { fg = colors.fg, bg = colors.bg, gui = 'bold' } },
  replace = { a = { fg = colors.fg, bg = colors.bg, gui = 'bold' } },
  inactive = {
    a = { fg = colors.fg, bg = colors.bg },
    b = { fg = colors.fg, bg = colors.bg },
    c = { fg = colors.fg, bg = colors.bg }
  }
}
