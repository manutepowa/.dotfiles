local cp = require("utils.clipboard")

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>qq")
vim.keymap.del("n", "<leader>n")
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
vim.keymap.del("n", "<leader>st")
vim.keymap.del("n", "<C-h>")
-- vim.keymap.del("n", "<C-w>")
vim.keymap.del("n", "<C-w><space>")
vim.keymap.del("n", "<C-w>d")
vim.keymap.del("n", "<C-w><C-d>")
vim.keymap.del("v", "<Tab>")
vim.keymap.del("v", "<S-Tab>")

vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left" })

-- Basic vim
vim.keymap.set({ "n", "x" }, "<A-j>", "5j")
vim.keymap.set({ "n", "x" }, "<A-k>", "5k")
-- vim.keymap.set("", "<esc>", ":noh<CR>", { silent = true })
vim.keymap.set("n", "<Leader>w", ":w<CR>")
vim.keymap.set("n", "<Leader>q", ":q<CR>")
vim.keymap.set("i", "kj", "<esc>")
vim.keymap.set("i", "<A-BS>", "<C-w>", { silent = true })

-- Copy and paste without clipboard
vim.keymap.set({ "n", "x" }, "d", '"_d')
-- vim.keymap.set("x", 'p', [["_dP]])
vim.keymap.set("x", "p", function()
  local val = vim.fn.getreg("+")
  vim.api.nvim_command([[normal! p]])
  vim.fn.setreg("+", val)
end, {})

-- Remove word
vim.keymap.set("n", "dw", "dwi")
vim.keymap.set("n", "diw", "diwi")

-- Search word
vim.keymap.set("n", "n", "nzzzv", { desc = "Search next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Search prev" })

-- Not select after line character
vim.keymap.set("v", "$", "$h")
vim.keymap.set({ "n", "v" }, "0", "^")

-- Move right when open autopairs
-- vim.keymap.set("i", "<A-l>", "<Right>")
vim.keymap.set("i", "<A-h>", "<Left>")

-- Tabs resize
vim.keymap.set("n", "<A-Down>", ":resize -5<CR>", { silent = true })
vim.keymap.set("n", "<A-Up>", ":resize +5<CR>", { silent = true })
vim.keymap.set("n", "<A-Left>", ":vertical resize -5<CR>", { silent = true })
vim.keymap.set("n", "<A-Right>", ":vertical resize +5<CR>", { silent = true })

-- Move block
vim.keymap.set("v", "<S-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("v", "<S-k>", ":move '<-2<CR>gv-gv")

-- BufferLine
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<A-c>", function()
  Snacks.bufdelete()
end, { silent = true })
vim.keymap.set("n", "<C-w>", function()
  Snacks.bufdelete()
end, { silent = true })
vim.keymap.set("n", "<S-A-l>", ":BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set("n", "<S-A-h>", ":BufferLineMovePrev<CR>", { silent = true })

vim.keymap.set("n", "gq", ":tabclose<CR>")

vim.cmd([[
  autocmd TabClosed * checktime
]]) -- With this reload buffer after close tab

-- Markdown viewer
vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>", { silent = true })

vim.keymap.set("c", "<A-j>", "<DOWN>", { silent = true })
vim.keymap.set("c", "<A-k>", "<UP>", { silent = true })

-- vim.keymap.set('n', '<leader>bf', function()
--   vim.lsp.buf.format({ timeout_ms = 5000 })
-- end, { silent = true })
-- vim.keymap.set('v', '<leader>bf', function()
--   return vim.lsp.buf.format()
-- end, { silent = true })

vim.keymap.set("n", "<leader>l", ":Lazy<cr>", { silent = true })
vim.keymap.set("n", "<leader>oa", cp.copy_current_location, { desc = "Copiar ruta y línea actual" })
vim.keymap.set("v", "<leader>oa", cp.copy_visual_location, { desc = "Copiar ruta y rango visual" })

-- CMD commands
-- map command to cmdline
vim.keymap.set("c", "<A-l>", "<Right>")
vim.keymap.set("c", "<A-h>", "<Left>")
vim.keymap.set("c", "<A-BS>", "<c-w>")

-- Smart navigation: wincmd dentro de Neovim, herdr pane focus en el borde
local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then
    return
  end
  if vim.env.TMUX and vim.env.TMUX ~= "" then
    -- Fallback a tmux por si alguna vez estás dentro de tmux
    local tmux = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "TmuxNavigate" .. tmux[dir])
    return
  end
  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH or "herdr"
    vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--current" })
  end
end

vim.keymap.set("n", "<C-h>", function() nav("h", "left") end, { silent = true, desc = "Nav left" })
vim.keymap.set("n", "<C-j>", function() nav("j", "down") end, { silent = true, desc = "Nav down" })
vim.keymap.set("n", "<C-k>", function() nav("k", "up") end, { silent = true, desc = "Nav up" })
vim.keymap.set("n", "<C-l>", function() nav("l", "right") end, { silent = true, desc = "Nav right" })

-- AI
-- vim.keymap.set("n", "<leader>ai", "<cmd>AvanteAsk<CR>", { desc = "Start AvanteAsk" })
-- vim.keymap.set("v", "<leader>ai", "<cmd>AvanteAsk<CR>", { desc = "Start AvanteAsk" })
