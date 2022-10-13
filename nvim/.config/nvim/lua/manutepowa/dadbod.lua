vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_win_position = 'right'
vim.g.db_ui_winwidth = 40

vim.g.db_ui_table_helpers = {
  mongo = {
    List = "{table}.find()",
  }
}

vim.g.db_ui_save_location = "~/db_connections"

vim.g.db_ui_icons = {
  expanded = {
    db = '▾ ',
    buffers = '▾ ',
    saved_queries = '▾ ',
    schemas = '▾ ',
    schema = '▾ פּ',
    tables = '▾ 藺',
    table = '▾ ',
  },
  collapsed = {
    db = '▸ ',
    buffers = '▸ ',
    saved_queries = '▸ ',
    schemas = '▸ ',
    schema = '▸ פּ',
    tables = '▸ 藺',
    table = '▸ ',
  },
  saved_query = '',
  new_query = '璘',
  tables = '離',
  buffers = '﬘',
  add_connection = '',
  connection_ok = '✓',
  connection_error = '✕',
}

-- opening it in a new tab
vim.keymap.set('n', '<leader>bb', ':DBUIToggle<cr>', { noremap = true, silent = true })

-- just close the tab, but context related of the keybinding
vim.keymap.set('n', '<leader><leader>tq', ':tabclose<cr>')
