vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { desc = "Organize Imports" })

vim.keymap.set("v", '<Tab>', '>gv', { noremap = true })
vim.keymap.set("v", '<S-Tab>', '<gv', { noremap = true })
vim.keymap.set("n", '<Leader>so', ':luafile %<CR>', { noremap = true })

vim.keymap.set("n", '<Leader>q', ':wincmd q<cr>', { noremap = true })

-- git
vim.keymap.set("n", '<Leader>gl', ':Flog<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>gs', ':Git<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>gw', ':Gwrite<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>gc', ':Git commit<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>gd', ':Gdiffsplit<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>gpl', ':Git pull<cr>', { noremap = true })


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
vim.keymap.set("x", 'p', [["_dP]])

-- Remove word
vim.keymap.set("n", 'dw', 'dwi', { noremap = true })
vim.keymap.set("n", 'diw', 'diwi', { noremap = true })

-- Apaño para que no vuelva al inicio (autoindent)
vim.keymap.set("i", '<CR>', '<CR>x<BS>')
vim.keymap.set("n", 'o', 'ox<BS>')
vim.keymap.set("n", 'O', 'Ox<BS>')

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

-- DiffGit
vim.keymap.set("n", "<leader>dd", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gq", ":tabclose<CR>", { noremap = true })

-- Markdown viewer
vim.keymap.set("n", "<leader>m", ":MarkdownPreview<CR>", { noremap = true, silent = true })

-- Codi inspector | Same that RunJS
-- vim.keymap.set("n","<leader>c", ":Codi!!<CR>", { noremap = true, silent = true })
vim.keymap.set('c', '<A-j>', '<DOWN>', { noremap = true, silent = true })
vim.keymap.set('c', '<A-k>', '<UP>', { noremap = true, silent = true })


-- LuaSnip
vim.cmd([[imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])
vim.cmd([[smap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>']])

-- Beta
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- Add these options.
    vim.cmd([[ setlocal formatoptions+=c ]]) -- Autowrap comments
    vim.cmd([[ setlocal formatoptions+=j ]]) -- Join comment lines when possible
    vim.cmd([[ setlocal formatoptions+=n ]]) -- Format recognizing numbered lists
    vim.cmd([[ setlocal formatoptions+=q ]]) -- Allow format with gq
    vim.cmd([[ setlocal formatoptions+=r ]]) -- Insert autocomment leader

    vim.cmd([[ setlocal formatoptions-=2 ]]) -- Use 2nd line indent when formatting
    vim.cmd([[ setlocal formatoptions-=a ]]) -- Automatic paragraph formatting
    vim.cmd([[ setlocal formatoptions-=o ]]) -- Automatic insert comment leader when 'o' or 'O'
    vim.cmd([[ setlocal formatoptions-=t ]]) -- Auto wrap with text width
  end,
})

vim.keymap.set('n', '<leader>bf', function()
  vim.lsp.buf.format({ timeout_ms = 5000 })
end, { noremap = true, silent = true })
vim.keymap.set('v', '<leader>bf', function()
  return vim.lsp.buf.format()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>l', ':Lazy<cr>', { noremap = true, silent = true })
