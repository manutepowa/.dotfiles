vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })

vim.keymap.set("v", '<Tab>', '>gv', { desc = "Indent right" })
vim.keymap.set("v", '<S-Tab>', '<gv', { desc = "Indent left" })
vim.keymap.set("n", '<Leader>so', ':so ~/.dotfiles/nvim/.config/nvim/init.lua<CR>', { noremap = true })

vim.keymap.set("n", '<Leader>q', ':wincmd q<cr>', { noremap = true })

-- git
vim.keymap.set("n", '<Leader>gl', ':Flogsplit -all<cr>', { noremap = true })
vim.cmd [[
  nmap <Leader>" ysiw"
  nmap <Leader>' ysiw'
  nmap <Leader>{ ysiw{
  nmap <Leader>[ ysiw[
]]


-- Basic vim
vim.keymap.set("n", '<A-j>', '5j', { noremap = true })
vim.keymap.set("n", '<A-k>', '5k', { noremap = true })
vim.keymap.set("x", '<A-j>', '5j', { noremap = true })
vim.keymap.set("x", '<A-k>', '5k', { noremap = true })
vim.keymap.set("", '<esc>', ':noh<CR>')
vim.keymap.set("n", '<Leader>w', ':w<CR>')
vim.keymap.set("n", '<Leader>q', ':q<CR>')
vim.keymap.set("i", 'kj', '<ESC>')
vim.keymap.set("i", '<A-BS>', '<c-w>', { noremap = true })

-- Copy and paste without clipboard
vim.keymap.set("n", 'd', '"_d', { noremap = true })
vim.keymap.set("x", 'd', '"_d', { noremap = true })
-- vim.keymap.set("x", 'p', [["_dP]])
vim.keymap.set("x", 'p', function()
  local val = vim.fn.getreg('+')
  vim.api.nvim_command([[normal! p]])
  vim.fn.setreg('+', val)
end, {})

-- Remove word
vim.keymap.set("n", 'dw', 'dwi', { noremap = true })
vim.keymap.set("n", 'diw', 'diwi', { noremap = true })

-- Search word
vim.keymap.set("n", 'n', 'nzzzv', { desc = "Search next" })
vim.keymap.set("n", 'N', 'Nzzzv', { desc = "Search prev" })



-- Not select after line character
vim.keymap.set("v", '$', '$h')
vim.keymap.set("n", '0', '^')
vim.keymap.set("v", '0', '^')

-- Move right when open autopairs
vim.keymap.set("i", '<A-l>', '<Right>')
vim.keymap.set("i", '<A-h>', '<Left>')

-- Tabs resize
vim.keymap.set("n", '<A-Down>', ':resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })


-- Move block
vim.keymap.set("v", "<S-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("v", "<S-k>", ":move '<-2<CR>gv-gv")

-- BufferLine
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", ":Bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-l>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-A-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "gq", ":tabclose<CR>", { noremap = true })

vim.cmd([[
  autocmd TabClosed * checktime
]]) -- With this reload buffer after close tab

-- Markdown viewer
vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>", { noremap = true, silent = true })

-- Codi inspector | Same that RunJS
-- vim.keymap.set("n","<leader>c", ":Codi!!<CR>", { noremap = true, silent = true })
vim.keymap.set('c', '<A-j>', '<DOWN>', { noremap = true, silent = true })
vim.keymap.set('c', '<A-k>', '<UP>', { noremap = true, silent = true })


-- LuaSnip
vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])
vim.cmd([[smap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])


vim.keymap.set('n', '<leader>bf', function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end, { noremap = true, silent = true })
vim.keymap.set('v', '<leader>bf', function()
  return vim.lsp.buf.format()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dap-repl",
  callback = function()
    vim.keymap.set("i", '<A-k>', '<Up>')
    vim.keymap.set("i", '<A-j>', '<Down>')
    vim.keymap.set("i", '<A-l>', '<Right>')
    vim.keymap.set("i", '<A-h>', '<Left>')
    vim.keymap.set('i', '<A-BS>', function() vim.cmd('normal vbd') end, { noremap = true, silent = true })
  end,
})

-- CMD commands
-- map command to cmdline
vim.keymap.set("c", "<A-l>", "<Right>")
vim.keymap.set("c", "<A-h>", "<Left>")
vim.keymap.set("c", '<A-BS>', '<c-w>')
