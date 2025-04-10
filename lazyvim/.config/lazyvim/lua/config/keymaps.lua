-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>wd")
vim.keymap.del("n", "<leader>wm")
vim.keymap.del("n", "<A-j>")
vim.keymap.del("i", "<A-j>")
vim.keymap.del("v", "<A-j>")
vim.keymap.del("n", "<A-k>")
vim.keymap.del("i", "<A-k>")
vim.keymap.del("v", "<A-k>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-w>")
vim.keymap.del("n", "<C-w>d")
vim.keymap.del("n", "<C-w><C-d>")

vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left" })

-- Basic vim
vim.keymap.set("n", "<A-j>", "5j", { noremap = true })
vim.keymap.set("n", "<A-k>", "5k", { noremap = true })
vim.keymap.set("x", "<A-j>", "5j", { noremap = true })
vim.keymap.set("x", "<A-k>", "5k", { noremap = true })
vim.keymap.set("", "<esc>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", ":w<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("i", "kj", "<ESC>")
-- vim.keymap.set("i", "<A-BS>", "<c-w>", { noremap = true })

-- Copy and paste without clipboard
vim.keymap.set("n", "d", '"_d', { noremap = true })
vim.keymap.set("x", "d", '"_d', { noremap = true })
-- vim.keymap.set("x", 'p', [["_dP]])
vim.keymap.set("x", "p", function()
  local val = vim.fn.getreg("+")
  vim.api.nvim_command([[normal! p]])
  vim.fn.setreg("+", val)
end, {})

-- Remove word
vim.keymap.set("n", "dw", "dwi", { noremap = true })
vim.keymap.set("n", "diw", "diwi", { noremap = true })

-- Search word
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev" })

-- Not select after line character
vim.keymap.set("v", "$", "$h")
vim.keymap.set("n", "0", "^")
vim.keymap.set("v", "0", "^")

-- Move right when open autopairs
vim.keymap.set("i", "<A-l>", "<Right>")
vim.keymap.set("i", "<A-h>", "<Left>")

-- Tabs resize
vim.keymap.set("n", "<A-Down>", ":resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Up>", ":resize +5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Left>", ":vertical resize -5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-Right>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- Move block
vim.keymap.set("v", "<S-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("v", "<S-k>", ":move '<-2<CR>gv-gv")

-- BufferLine
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", ":bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", ":bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-l>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gq", ":tabclose<CR>", { noremap = true })

vim.cmd([[
  autocmd TabClosed * checktime
]]) -- With this reload buffer after close tab

-- Markdown viewer
vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>", { noremap = true, silent = true })

vim.keymap.set("c", "<A-j>", "<DOWN>", { noremap = true, silent = true })
vim.keymap.set("c", "<A-k>", "<UP>", { noremap = true, silent = true })

-- vim.keymap.set('n', '<leader>bf', function()
--   vim.lsp.buf.format({ timeout_ms = 5000 })
-- end, { noremap = true, silent = true })
-- vim.keymap.set('v', '<leader>bf', function()
--   return vim.lsp.buf.format()
-- end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>l", ":Lazy<cr>", { noremap = true, silent = true })

-- CMD commands
-- map command to cmdline
vim.keymap.set("c", "<A-l>", "<Right>")
vim.keymap.set("c", "<A-h>", "<Left>")
vim.keymap.set("c", "<A-BS>", "<c-w>")

--
local nvim_tmux_nav = require("nvim-tmux-navigation")

vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft) -- Navigate to the left pane
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown) -- Navigate to the bottom pane
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp) -- Navigate to the top pane
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight) -- Navigate to the right pane

-- AI
vim.keymap.set("n", "<leader>ai", "<cmd>AvanteAsk<CR>", { desc = "Start AvanteAsk" })
vim.keymap.set("v", "<leader>ai", "<cmd>AvanteAsk<CR>", { desc = "Start AvanteAsk" })
