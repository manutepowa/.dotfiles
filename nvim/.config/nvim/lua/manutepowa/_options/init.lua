vim.cmd('filetype plugin indent on')
-- vim.cmd([[
--     set number
--     set relativenumber
--     set autoindent
--     set tabstop=2
--     set shiftwidth=2
--     set softtabstop=2
--     set smarttab
--     set mouse=a
--     set nowrap
--     set ignorecase
--     set completeopt-=preview " For No Previews
--     set backspace=indent,eol,start
--     set encoding=utf-8
--     set hidden
--     set nobackup
--     set nowritebackup
--     set cmdheight=2
--     set updatetime=300
--     set shortmess+=c
--     set scrolloff=5
--     set ttimeoutlen=50
--     set nofoldenable
--     set clipboard+=unnamedplus
-- ]])

vim.o.shortmess = vim.o.shortmess .. "c"
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.backspace = {'indent', 'eol', 'start'}
vim.opt.fileencoding = "utf-8"
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1
vim.opt.updatetime = 300
vim.opt.scrolloff = 5
vim.opt.ttimeoutlen = 50
vim.opt.foldenable = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.number = true
vim.opt.wrap = false
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = true
-- MultiCursor
vim.cmd([[
	let g:VM_maps = {}
	let g:VM_maps['Find Under']         = '<S-M-n>'           
	let g:VM_maps['Find Subword Under'] = '<S-M-n>'           
	let g:VM_maps["Select Cursor Down"] = '<S-M-j>'      
	let g:VM_maps["Select Cursor Up"]   = '<S-M-k>'        
]])

