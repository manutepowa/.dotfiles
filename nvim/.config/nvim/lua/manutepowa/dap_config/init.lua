local dap = require "dap"
local icons = require "manutepowa.icons"

-- Enable DAP virtual text
require("nvim-dap-virtual-text").setup {
  enabled = true,                        -- enable this plugin (the default)
  enabled_commands = false,              -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
  highlight_changed_variables = false,   -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
  highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
  show_stop_reason = true,               -- show stop reason when stopped for exceptions
  commented = false,                     -- prefix virtual text with comment string
  only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
  all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
  filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
  -- experimental features:
  virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
  all_frames = true,                     -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
  virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
  virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
  -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
vim.keymap.set('n', '<leader>dcb', ':lua require"dap".clear_breakpoints()<CR>')
vim.keymap.set('n', '<leader>dso', ':lua require"dap".step_out()<CR>')
vim.keymap.set('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
vim.keymap.set('n', '<A-CR>', ':lua require"dap".step_over()<CR>')
vim.keymap.set('n', '<leader>ds', ':lua require"dap".continue()<CR>')
vim.keymap.set('n', '<leader>drt', ':lua require"dap".repl.toggle()<CR>')
vim.keymap.set('n', '<leader>dt', ':lua require("manutepowa.dap_config.dap-fn").stop()<cr>', { noremap = true })
vim.keymap.set('n', '<F2>', ':lua require("dapui").eval()<CR>')
vim.keymap.set('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
vim.keymap.set('n', '<leader>dhh', '<cmd>lua require"dapui.variables".hover()<CR>')
vim.keymap.set('v', '<leader>dhv', '<cmd>lua require"dapui.variables".visual_hover()<CR>')



dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '🟦', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '⭐️', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define("DapLogPoint", { text = icons.dap.LogPoint, texthl = "DapLogPoint", linehl = "", numhl = "" })

dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js" }
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
  -- icons = { expanded = "▾", collapsed = "▸" },
  icons = { expanded = icons.ui.ArrowOpen, collapsed = icons.ui.ArrowClosed, current_frame = icons.ui.Indicator },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<TAB>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "asdf",
    repl = "r",
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = false,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = icons.dap.Pause,
      play = icons.dap.Play,
      step_into = icons.dap.StepInto,
      step_over = icons.dap.StepOver,
      step_out = icons.dap.StepOut,
      step_back = icons.dap.StepBack,
      run_last = icons.dap.RunLast,
      terminate = icons.dap.Terminate,
    },
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
