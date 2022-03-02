local dap = require "dap"
dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🟦', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})



dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { vim.fn.stdpath("data") .. "/dapinstall/php/vscode-php-debug/out/phpDebug.js" }
}
-- print(os.getenv('HOME') .. "/dapinstall/php/vscode-php-debug/out/phpDebug.js")
dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9000,
    -- serverSourceRoot = '/var/www/html/httpdocs/',
    -- localSourceRoot = '${workspaceFolder}/httpdocs/',
    pathMappings = {
      ["/var/www/html/httpdocs/"] = "${workspaceFolder}/httpdocs/",
      ["/var/www/html/httpdocs/web/"] = "${workspaceFolder}/httpdocs/web/"
    }
  }
}


-- Mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end



-- vim.api.nvim_set_keymap('n', '<leader>db', ':lua require\'dap\'.toggle_breakpoint()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>ds', ':lua require\'dap\'.continue()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>dt', ':lua require"dap".terminate()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>dsi', ':lua require\'dap\'.step_into()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<A-CR>', ':lua require\'dap\'.step_over()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>dso', ':lua require\'dap\'.step_out()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>dbl', ':lua require\'dap\'.list_breakpoints()<cr>', {noremap = true})
-- vim.api.nvim_set_keymap('n', '<leader>dbc', ':lua require\'dap\'.clear_breakpoints()<cr>', {noremap = true})
-- vim.api.nvim_exec([[
--   augroup DapRepl
--     autocmd!
--     au FileType dap-repl lua require('dap.ext.autocompl').attach()
--   augroup END
-- ]], false)

-- vim.api.nvim_exec([[
--   augroup NvimDap
--     autocmd!
--     au FileType dap-repl lua require('dap.ext.autocompl').attach()
--   augroup END 
-- ]], false)

local dap_ui = require "dapui"
dap_ui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<TAB>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.75, -- Can be float or integer > 1
        expand = { "<TAB>", "<2-LeftMouse>" },
        repl = "r",
      },
      {
        id = "watches",
        size = 0.25,
        expand = { "<TAB>", "<2-LeftMouse>" },
        remove = "d",
        repl = "r",
      },
    },
    size = 50,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})


dap.listeners.after["event_initialized"]["manutepowa"] = function()
  dap_ui.open()
end



vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dso', ':lua require"dap".step_out()<CR>')
map('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
map('n', '<A-CR>', ':lua require"dap".step_over()<CR>')
map('n', '<leader>ds', ':lua require"dap".continue()<CR>')
-- map('n', '<leader>dt', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dt', ':lua require("manutepowa.dap_config.dap-fn").stop()<cr>')
map('n', '<F2>', ':lua require("dapui").eval()<CR>')

map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
map('n', '<leader>dhh', '<cmd>lua require"dapui.variables".hover()<CR>')
map('v', '<leader>dhv', '<cmd>lua require"dapui.variables".visual_hover()<CR>')


-- require('dap.ext.vscode').load_launchjs()
