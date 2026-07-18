return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    enabled = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      system_prompt = "Responde siempre en el mismo idioma que se te pregunte.",
      model = "gpt-4.1", -- mantenemos tu modelo preferido
      temperature = 0.2, -- más determinista
      layout = "float", -- experiencia moderna (omite si ya es default)
      auto_follow_cursor = true, -- sigue el cursor para mejor contexto
      answer_header = "<M3JS />",
      context = { "selection", "buffer" }, -- prioriza selección si existe
      auto_insert_mode = true,
      -- show_help = false,             -- descomenta según preferencia
      -- logging = { enabled = false }, -- descomenta si quieres desactivar logs
      mappings = {
        accept_diff = { normal = "<Tab>" },
        -- submit = { normal = "<CR>", insert = "<C-s>" }, -- activa si tu versión lo soporta
        -- yank_last = { normal = "gy" },                  -- si disponible
        -- scroll_up = { normal = "<C-u>" },
        -- scroll_down = { normal = "<C-d>" },
      },
    },
    keys = {
      { "<leader>ci", "<cmd>CopilotChat<CR>", mode = { "n", "v" } },
      { "<leader>cl", "<cmd>CopilotChatReset<CR>", mode = { "n", "v" } },
      { "<leader>ct", "<cmd>CopilotChatStop<CR>", mode = { "n", "v" } },
    },
  },
  {
    "coder/claudecode.nvim",
    enabled = false,
    dependencies = { "folke/snacks.nvim" },
    opts = {
      -- Server Configuration
      auto_start = true,
      log_level = "info", -- "trace", "debug", "info", "warn", "error"

      -- Terminal Configuration
      terminal = {
        -- split_side = "right", -- "left" or "right"
        -- split_width_percentage = 0.60,
        snacks_win_opts = {
          position = "float",
          width = 0.9,
          height = 0.9,
          keys = {
            claude_hide = {
              "<A-,>",
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide",
            },
            term_normal = {
              "kj",
              function()
                return vim.cmd("stopinsert")
              end,
              mode = "t",
              expr = false,
              desc = "kj to normal mode",
            },
          },
        },
      },

      -- Diff Integration
      diff_opts = {
        auto_close_on_accept = true,
        vertical_split = false,
        open_in_current_tab = true,
      },
    },
    keys = {
      { "<leader>c", nil, desc = "AI/Claude Code" },
      -- { "<leader>cc", "<cmd>ClaudeCode<cr>", desc = "Claude Code Toggle Claude" },
      -- { "<leader>cf", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code Focus" },
      { "<leader>cr", "<cmd>ClaudeCode --resume<cr>", desc = "Claude Code Resume" },
      { "<A-,>", "<cmd>ClaudeCode<cr>", desc = "Claude Code Continue" },
      { "<leader>cm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Claude Code Select model" },
      { "<leader>cb", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude Code add current buffer" },
      { "<leader>cc", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude Code send to Claude" },
      {
        "<leader>cs",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>ca", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>cd", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    },
  },
}
