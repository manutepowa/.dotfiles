return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  keys = {
    { "<leader>du", "<cmd>DBUIToggle<cr>", desc = "Toggle UI" },
    -- { "Tab",        "<Plug>(DBUI_SelectLine)", desc = "Select" },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_force_echo_notifications = 1
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.dbs = {
      plataformas = 'mysql://db:db@127.0.0.1:32785/db',
      parque = 'mysql://db:db@127.0.0.1:32792/db',
    }

    local id = vim.api.nvim_create_augroup('dadbod_bindings', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = id,
      pattern = { 'dbui' },
      callback = function()
        vim.api.nvim_set_keymap('n', '<Tab>', '<Plug>(DBUI_SelectLine)', { silent = true })
        vim.api.nvim_set_keymap('n', 'q', '<Plug>(DBUI_Quit)', { silent = true })
      end,
    })
    vim.api.nvim_create_autocmd({ 'FileType' }, {
      group = vim.api.nvim_create_augroup('dbui_sql', { clear = true }),
      pattern = { 'mysql' },
      callback = function(e)
        require('cmp').setup.buffer({
          sources = {
            { name = 'vim-dadbod-completion' },
            { name = 'buffer' },
          },
        })
      end,
    })

    vim.cmd([[
			autocmd FileType dbout setlocal nofoldenable
			autocmd FileType mysql setlocal nofoldenable
		]])

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = {
        "dbout",
        "mysql"
      },
      callback = function()
        vim.cmd [[
          nnoremap <silent> <buffer> q :pclose<CR>
          " nnoremap <silent> <buffer> <esc> :close<CR>
          set nobuflisted
        ]]
      end,
    })
  end,
}
