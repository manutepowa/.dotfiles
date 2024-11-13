return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui"
  },
  config = function()
    local dap = require "dap"
    local icons = require "config.icons"

    vim.keymap.set('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
    vim.keymap.set('n', '<leader>dcb', ':lua require"dap".clear_breakpoints()<CR>')
    vim.keymap.set('n', '<leader>dso', ':lua require"dap".step_out()<CR>')
    vim.keymap.set('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')
    vim.keymap.set('n', '<A-CR>', ':lua require"dap".step_over()<CR>')
    vim.keymap.set('n', '<leader>ds', ':lua require"dap".continue()<CR>')
    vim.keymap.set('n', '<leader>drt', ':lua require"dap".repl.toggle()<CR>')
    vim.keymap.set('n', '<leader>dt', ':lua require("config.utils").stop()<cr>', { noremap = true })
    vim.keymap.set('n', '<F2>', ':lua require("dapui").eval()<CR>')
    -- vim.keymap.set('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')
    vim.keymap.set('n', '<leader>dhh', '<cmd>lua require"dapui.variables".hover()<CR>')



    dap.defaults.fallback.terminal_win_cmd = '80vsplit new'
    vim.fn.sign_define('DapBreakpoint', { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected',
      { text = icons.ui.Bug, texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', {
      text = icons.ui.BoldArrowRight,
      texthl = "DiagnosticSignWarn",
      linehl = "Visual",
      numhl = "DiagnosticSignWarn",
    })
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
          ["/var/www/html"] = "${workspaceFolder}",
          -- ["/var/www/html/httpdocs/web/"] = "${workspaceFolder}/httpdocs/web/",
          -- ["/var/www/html/parque/"] = "${workspaceFolder}/parque/",
          -- ["/var/www/html/parque/web/"] = "${workspaceFolder}/parque/web/"
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
      icons = {
        expanded = icons.ui.ArrowOpen,
        collapsed = icons.ui.ArrowClosed,
        current_frame = icons.ui.Indicator,
        circular = ""
      },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<TAB>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "---",
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
          },
          size = 10,
          position = 'bottom',
        },
      },
      windows = { indent = 1 },
    })


    dap.listeners.after["event_initialized"]["config"] = function()
      dap_ui.open {}
    end
    local session = require('dap').session()
    local lang = nil

    if session then
      lang = session.config and session.config.repl_lang or session.filetype
      if not lang then -- allow user to provide empty string to supress this message
        vim.notify("REPL highlight language not found for current dap session", vim.log.levels.WARN)
      end
    end

    if lang and lang ~= '' then
      require('nvim-dap-repl-highlights').setup_injections(0, lang)
    end
  end
}
