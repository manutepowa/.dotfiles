vim.g.mapleader = " "



vim.keymap.set("v", '<Tab>', '>gv', { noremap = true })
vim.keymap.set("v", '<S-Tab>', '<gv', { noremap = true })
vim.keymap.set("n", '<Leader>so', ':so %<cr>', { noremap = true })


vim.keymap.set("n", '<Leader>h', ':wincmd h<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>j', ':wincmd j<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>k', ':wincmd k<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>l', ':wincmd l<cr>', { noremap = true })
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

-- Telescope
vim.keymap.set("n", '<Leader>fg', ':Telescope live_grep<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>fh', ':Telescope oldfiles<cr>', { noremap = true })
vim.keymap.set("n", "<Leader>''", ':Telescope help_tags<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>fG', ':Telescope grep_string<cr>', { noremap = true })
vim.keymap.set("n", '<Leader>fb', ':Telescope buffers<cr>', { noremap = true })


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
vim.keymap.set("x", 'p', '"_dP', { noremap = true })

-- Apaño para que no vuelva al inicio (autoindent)
vim.keymap.set("i", '<CR>', '<CR>x<BS>')
vim.keymap.set("n", 'o', 'ox<BS>')
vim.keymap.set("n", 'O', 'Ox<BS>')

-- Not select after line character
vim.keymap.set("v", '$', '$h')
vim.keymap.set("n", '0', '^')

-- Move right when open autopairs
vim.keymap.set("i", '<A-l>', '<Right>')
vim.keymap.set("i", '<A-h>', '<Left>')

-- NVIM TREE
vim.keymap.set("n", '<A-e>', ':NvimTreeToggle<CR>')

-- Tabs resize
vim.keymap.set("n", '<A-Down>', ':resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Up>', ':resize +5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set("n", '<A-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })


-- Move block
vim.keymap.set("x", "<C-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<C-k>", ":move '<-2<CR>gv-gv")

-- BufferLine
vim.keymap.set("n", "<A-l>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", ":Bdelete!<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", ":BufferLineMoveNext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", ":BufferLineMovePrev<CR>", { noremap = true, silent = true })

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
