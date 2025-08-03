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
      vim.api.nvim_input("<c-w>")
    end, { noremap = true, silent = true })
  end,
})

vim.cmd([[
  highlight SnacksIndentDark guifg=#3C3C3C guibg=NONE
  highlight SnacksIndentScopeDark guifg=#4E4E4E guibg=NONE
]])

-- Avante AI assistant autocmds for better closing behavior
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "AvanteInput",
    "Avante",
  },
  callback = function()
    -- Set buffer options for better UX
    vim.opt_local.buflisted = false
    vim.opt_local.bufhidden = "wipe"

    -- Quick close with 'q' key
    vim.keymap.set("n", "q", "<cmd>AvanteToggle<CR>", {
      buffer = true,
      silent = true,
      desc = "Toggle Avante",
    })

    -- Keep existing clear functionality
    vim.keymap.set("n", "<leader>cl", "<cmd>AvanteClear<CR>", {
      buffer = true,
      desc = "Clear Avante",
    })

    -- Stop current operation
    vim.keymap.set("n", "<leader>cs", "<cmd>AvanteStop<CR>", {
      buffer = true,
      desc = "Stop Avante",
    })
  end,
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "snacks_picker_input",
  },
  callback = function()
    vim.keymap.set("i", "<A-BS>", function()
      vim.api.nvim_input("<c-w>")
    end, { noremap = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion", -- Ajusta el filetype si es diferente
  callback = function()
    vim.keymap.set("n", "q", function()
      require("codecompanion").toggle()
    end, { buffer = true, silent = true })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "copilot-*",
  callback = function()
    -- Set buffer-local options
    vim.opt_local.relativenumber = false
    vim.opt_local.number = false
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "markdown",
  command = "setlocal nospell",
})

-- Automatically check health after startup if no files are opened
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.defer_fn(function()
        vim.cmd("checkhealth lazy")
      end, 1000)
    end
  end,
})
