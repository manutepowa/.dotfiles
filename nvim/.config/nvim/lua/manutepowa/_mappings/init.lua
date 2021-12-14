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
vim.g.NERDTreeQuitOnOpen = 1
nmap('<C-f>', ':NERDTreeFocus<CR>')
nmap('<C-n>', ':NERDTree<CR>')
nmap('<C-e>', ':NERDTreeToggle<CR>')

-- Tabs resize
nmap('<t-j>', ':resize -5<CR>')
