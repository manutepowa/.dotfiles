local function map(mode)
  return function(lhs, rhs, opt)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt or {})
  end
end

-- Documentació
-- * para buscar la palabra seleccionada
-- gv para seleccionar lo último que seleccionó de nuevo
-- vit and vat seleccionar bloque completo por fuera o por dentro

-- don't use arrow keys
map('', '<up>', '<nop>', { noremap = true })
map('', '<down>', '<nop>', { noremap = true })
map('', '<left>', '<nop>', { noremap = true })
map('', '<right>', '<nop>', { noremap = true })

--[[ local nmap = map('n') ]]

vim.g.mapleader = ' '

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
vim.keymap.set("n", '<C-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("n", '<C-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", '<C-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vim.keymap.set("v", '<C-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

-- BufferLine
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-h>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-c>", "<cmd>Bdelete!<CR>", { noremap = true, silent = true })

-- DiffGit
vim.keymap.set("n", "<leader>dd", ":DiffviewOpen<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>df", ":DiffviewFileHistory %<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gq", ":tabclose<CR>", { noremap = true })

-- Markdown viewer
vim.keymap.set("n", "<leader>m", ":Glow<CR>", { noremap = true, silent = true })

-- Codi inspector | Same that RunJS
-- vim.keymap.set("n","<leader>c", ":Codi!!<CR>", { noremap = true, silent = true })
vim.keymap.set('c', '<A-j>', '<DOWN>', { noremap = true, silent = true })
vim.keymap.set('c', '<A-k>', '<UP>', { noremap = true, silent = true })
