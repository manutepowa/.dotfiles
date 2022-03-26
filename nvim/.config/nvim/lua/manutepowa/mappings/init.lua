local function map(mode)
  return function (lhs, rhs, opt)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt or {})
  end
end

-- Documentació
-- * para buscar la palabra seleccionada
-- gv para seleccionar lo último que seleccionó de nuevo
-- vit and vat seleccionar bloque completo por fuera o por dentro

local nmap = map('n')
local vmap = map('v')
local imap = map('i')
local xmap = map('x')
local _map = map('')

vim.g.mapleader = ' '

-- Basic vim
nmap('<c-j>', '5j')
nmap('<c-k>', '5k')
xmap('<c-j>', '5j')
xmap('<c-k>', '5k')
_map('<esc>', ':noh<CR>')
nmap('<Leader>w', ':w<CR>')
nmap('<Leader>q', ':q<CR>')
imap('kj', '<ESC>')

-- Copy and paste without clipboard
nmap('d', '"_d', { noremap = true })
xmap('d', '"_d', { noremap = true })
xmap('p', '"_dP', { noremap = true })

-- Apaño para que no vuelva al inicio (autoindent)
imap('<CR>', '<CR>x<BS>')
nmap('o', 'ox<BS>')
nmap('O', 'Ox<BS>')

-- Move right when open autopairs
imap('<A-n>', '<Right>')


-- NVIM TREE
nmap('<A-e>', ':NvimTreeToggle<CR>')

-- Tabs resize
nmap('<A-Down>', ':resize -5<CR>', { noremap = true, silent = true })
nmap('<A-Up>', ':resize +5<CR>', { noremap = true, silent = true })
nmap('<A-Left>', ':vertical resize -5<CR>', { noremap = true, silent = true })
nmap('<A-Right>', ':vertical resize +5<CR>', { noremap = true, silent = true })

-- MultiCursor
vim.cmd([[
	let g:VM_maps = {}
	let g:VM_maps['Find Under']         = '<S-M-n>'           
	let g:VM_maps['Find Subword Under'] = '<S-M-n>'           
	let g:VM_maps["Select Cursor Down"] = '<S-M-j>'      
	let g:VM_maps["Select Cursor Up"]   = '<S-M-k>'        
]])

-- No comment on new line
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])


-- 
-- Move block
nmap('<A-j>', ":MoveLine(1)<CR>", { noremap = true, silent = true })
nmap('<A-k>', ":MoveLine(-1)<CR>", { noremap = true, silent = true })
vmap('<A-j>', ":MoveBlock(1)<CR>", { noremap = true, silent = true })
vmap('<A-k>', ":MoveBlock(-1)<CR>", { noremap = true, silent = true })

-- BufferLine
nmap("<A-l>", ":bnext<CR>", { noremap = true, silent = true })
nmap("<A-h>", ":bprevious<CR>", { noremap = true, silent = true })
nmap("<A-c>", "<cmd>bdelete!<CR>", { noremap = true, silent = true })

-- DiffGit
nmap("<leader>dd", ":DiffviewOpen<CR>", { noremap = true, silent = true })
nmap("<leader>df", ":DiffviewFileHistory<CR>", { noremap = true, silent = true })
nmap("<leader>dc", ":DiffviewClose<CR>", { noremap = true })
