let mapleader=" "

" vnoremap <Tab> >gv
" vnoremap <S-Tab> <gv

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :wincmd q<CR>

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" Encerrar palabra o selección entre .....
nmap <Leader>" ysiw"
nmap <Leader>' ysiw'
nmap <Leader>{ ysiw{
nmap <Leader>[ ysiw[
"""""""""""""""""""""""""vim-fugitive settings""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gs :Git<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR>
nnoremap <silent> <leader>gpl :Git pull<CR>
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" No auto comment on new line
augroup NoAutoComment
  au!
  au FileType * setlocal formatoptions-=cro
augroup end

lua << EOF
require('Comment').setup()
EOF


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>'' <cmd>Telescope help_tags<cr>

lua require('plugins')
lua require('manutepowa')
set secure
