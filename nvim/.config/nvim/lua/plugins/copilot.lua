return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      panel = {
        keymap = {
          jump_next = "<c-j>",
          jump_prev = "<c-k>",
          accept = "<c-a>",
          refresh = "r",
          open = "<M-CR>",
        },
        layout = {
          position = "right", -- | top | left | right
          ratio = 0.5,
        },
      },
      suggestion = {
        auto_trigger = true,
        keymap = {
          -- accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<C-j>",
          prev = "<C-k>",
          dismiss = "<C-e>",
        },
      },
    })

    vim.keymap.set('i', '<Tab>', function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, true, true), "n")
      end
    end)
  end,
}
