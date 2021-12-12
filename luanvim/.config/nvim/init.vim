" Allows to have a .nvimrc per project folder
set exrc

syntax enable

let mapleader = ' '
inoremap kj <ESC>
" noh - no highlight when search
map <esc> :noh <CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k


let g:gitgutter_map_keys = 0

" forward and backward search of current word
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap # ?\<<C-R>=expand('<cword>')<CR>\><CR>

vnoremap <leader>p "_dP

" remove whitespaces
autocmd BufWritePre * %s/\s\+$//e

" augroup fmtphp
"   autocmd!
"   autocmd BufWritePre filetype php undojoin | lua vim.lsp.buf.formatting()
" augroup END

filetype plugin indent on
autocmd FileType yaml setl indentkeys-=<:>
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType cucumber setl indentkeys-=<:>
autocmd FileType cucumber setlocal ts=2 sts=2 sw=2 expandtab

autocmd BufWritePost */alpha/**.lua lua require('plenary.reload').reload_module('alpha')


inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap $ $<c-g>u
inoremap > ><c-g>u

lua require('plugins')
lua require("alpha")

" Has to be the last line for the .nvimrc per project
set secure
