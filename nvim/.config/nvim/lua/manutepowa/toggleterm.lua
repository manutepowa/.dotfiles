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

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts)

  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "toggleterm" },
  callback = function()
    vim.cmd [[
      set cmdheight=1 
    ]]
  end,
})

local Terminal = require("toggleterm.terminal").Terminal

local htop = Terminal:new({ cmd = "htop", hidden = true })

function _HTOP_TOGGLE()
  htop:toggle()
end

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
