local dap = require "dap"
local g = vim.g

-- Mappings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- vim.cmd([[au FileType dap-repl lua require('dap.ext.autocompl').attach()]])
-- require("dap.ext.autocompl").attach()
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  callback = function()
    require("dap.ext.autocompl").attach()
  end,
})
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dcb', ':lua require"dap".clear_breakpoints()<CR>')
map('n', '<leader>dso', ':lua require"dap".step_out()<CR>')
map('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
map('n', '<A-CR>', ':lua require"dap".step_over()<CR>')
map('n', '<leader>ds', ':lua require"dap".continue()<CR>')
map('n', '<leader>drt', ':lua require"dap".repl.toggle()<CR>')
-- map('n', '<leader>dt', ':lua require"dap".terminate()<CR>')
map('n', '<leader>dt', ':lua require("manutepowa.dap_config.dap-fn").stop()<cr>', { noremap = true })
map('n', '<F2>', ':lua require("dapui").eval()<CR>')

map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
map('n', '<leader>dhh', '<cmd>lua require"dapui.variables".hover()<CR>')
map('v', '<leader>dhv', '<cmd>lua require"dapui.variables".visual_hover()<CR>')
-- Enable DAP virtual text
g.dap_virtual_text = true

dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })


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
    port = 9003,
    -- serverSourceRoot = '/var/www/html/httpdocs/',
    -- localSourceRoot = '${workspaceFolder}/httpdocs/',
    pathMappings = {
      ["/var/www/html/httpdocs/"] = "${workspaceFolder}/httpdocs/",
      ["/var/www/html/httpdocs/web/"] = "${workspaceFolder}/httpdocs/web/",
      ["/var/www/html/parque/"] = "${workspaceFolder}/parque/",
      ["/var/www/html/parque/web/"] = "${workspaceFolder}/parque/web/"
    }
  }
}

dap.adapters.node = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath("data") .. "/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js" }
}
-- Nodejs
-- dap.adapters.chrome = {
--     type = 'executable',
--     command = 'node',
--     args = { vim.fn.stdpath("data") .. "/dapinstall/chrome/vscode-chrome-debug/out/src/chromeDebug.js" }
-- }
dap.configurations.javascript = {
  {
    type = "node",
    request = "attach",
    cwd = vim.fn.getcwd(),
    protocol = "inspector",
    localRoot = "${workspaceFolder}/httpdocs/",
    remoteRoot = "/var/www/html/httpdocs/",
  }
}



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
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.73, -- Can be float or integer > 1
          expand = { "<TAB>", "<2-LeftMouse>" },
          repl = "r",
        },
        {
          id = "watches",
          size = 0.27,
          expand = { "<TAB>", "<2-LeftMouse>" },
          remove = "d",
          repl = "r",
        },
      },
      size = 50,
      position = 'left',
    },
    {
      elements = {
        'repl',
        -- 'console',
      },
      size = 10,
      position = 'bottom',
    },
  },
  -- floating = {
  --   max_height = nil, -- These can be integers or a float between 0 and 1.
  --   max_width = nil, -- Floats will be treated as percentage of your screen.
  --   border = "single", -- Border style. Can be "single", "double" or "rounded"
  --   mappings = {
  --     close = { "q", "<Esc>" },
  --   },
  -- },
  windows = { indent = 1 },
})


dap.listeners.after["event_initialized"]["manutepowa"] = function()
  dap_ui.open()
end





-- require('dap.ext.vscode').load_launchjs()
