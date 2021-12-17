local function map(mode)
  return function (lhs, rhs, opt)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt or {})
  end
end

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

-- Move right when open autopairs
imap('<A-n>', '<Right>')

-- NVIM TREE
vim.g.nvim_tree_quit_on_open = 1
nmap('<leader>n', ':NvimTreeFindFile<CR>')
nmap('<C-e>', ':NvimTreeToggle<CR>')
nmap('<leader>r', ':NvimTreeRefresh<CR>')

-- Tabs resize
nmap('<t-j>', ':resize -5<CR>')

-- MultiCursor
vim.cmd([[
	let g:VM_maps = {}
	let g:VM_maps['Find Under']         = '<S-M-n>'           
	let g:VM_maps['Find Subword Under'] = '<S-M-n>'           
	let g:VM_maps["Select Cursor Down"] = '<S-M-j>'      
	let g:VM_maps["Select Cursor Up"]   = '<S-M-k>'        
]])

