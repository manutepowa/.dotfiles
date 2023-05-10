return {
  "akinsho/toggleterm.nvim",
  keys = {
    { [[<A-->]] },
  },
  cmd = {
    "ToggleTerm",
    "TermExec",
    "ToggleTermToggleAll",
    "ToggleTermSendCurrentLine",
    "ToggleTermSendVisualLines",
    "ToggleTermSendVisualSelection",
  },
  config = function()
    local status_ok, toggleterm = pcall(require, "toggleterm")
    if not status_ok then
      return
    end

    toggleterm.setup({
      -- size = 30,
      open_mapping = [[<A-->]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      -- highlights = {
      --   FloatBorder = {
      --     guifg = "#06b6d4",
      --   },
      -- },
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      }
    })
    function Set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://* lua Set_terminal_keymaps()')
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "toggleterm" },
      callback = function()
        vim.cmd [[
      set cmdheight=1
    ]]
      end,
    })
    local opts = { silent = true }
    local keymap = vim.keymap.set
    keymap("n", "<A-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)
    keymap("t", "<A-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)
    keymap("i", "<A-1>", "<cmd>1ToggleTerm direction=float<cr>", opts)

    keymap("n", "<A-2>", "<cmd>2ToggleTerm direction=float<cr>", opts)
    keymap("t", "<A-2>", "<cmd>2ToggleTerm direction=float<cr>", opts)
    keymap("i", "<A-2>", "<cmd>2ToggleTerm direction=float<cr>", opts)

    keymap("n", "<A-3>", "<cmd>3ToggleTerm direction=float<cr>", opts)
    keymap("t", "<A-3>", "<cmd>3ToggleTerm direction=float<cr>", opts)
    keymap("i", "<A-3>", "<cmd>3ToggleTerm direction=float<cr>", opts)

    keymap("t", "<A-k>", "<up>", opts)
    keymap("t", "<A-j>", "<down>", opts)
    keymap("t", "<A-l>", "<C-right>", opts)
    keymap("t", "<A-h>", "<left>", opts)
  end
}
