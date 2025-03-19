-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "Jaq",
    "qf",
    "help",
    "man",
    "markdown",
    "lspinfo",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "floggraph",
    "fugitive",
    "httpResult",
    "git",
    "NeogitStatus",
    "query",
    "AvanteInput",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      " nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "gitgraph",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q :bdelete!<CR>
      " nnoremap <silent> <buffer> <esc> :close<CR>
      set nobuflisted
    ]])
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  callback = function()
    vim.keymap.set("i", "<A-k>", "<Up>")
    vim.keymap.set("i", "<A-j>", "<Down>")
    vim.keymap.set("i", "<A-l>", "<Right>")
    vim.keymap.set("i", "<A-h>", "<Left>")
    vim.keymap.set("i", "<A-BS>", function()
      vim.cmd("normal vbd")
    end, { noremap = true, silent = true })
  end,
})

vim.cmd([[
  highlight SnacksIndentDark guifg=#3C3C3C guibg=NONE
  highlight SnacksIndentScopeDark guifg=#4E4E4E guibg=NONE
]])
