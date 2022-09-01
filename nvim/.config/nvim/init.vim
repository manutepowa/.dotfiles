let mapleader=" "

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap <leader>so :so %<CR>


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
"""""""""""""""""""""""""vim-fugitive settings and flog""""""""""""""""""""""""""""""
nnoremap <silent> <leader>gl :Flog<CR>
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



hi DiffAdd guifg=NONE guibg=#4b5632
hi DiffDelete guifg=NONE guibg=#d74f56
hi DiffChange guifg=NONE guibg=#63c1e6

" Visual selection color
" hi Visual guifg=#000000 guibg=#FFFFFF gui=none

autocmd BufNewFile,BufRead *.theme set syntax=php
autocmd BufRead,BufNewFile *.mdx set filetype=markdown

" Codi test
nnoremap <leader>c :call ToggleCodi()<cr>
" nnoremap <F8> :Codi!!<cr>

let g:codi#raw = 0
let g:codi#width = 60
let g:codi#rightsplit = 1
let g:codi#rightalign = 0
let g:codi#virtual_text = 0
let g:codi#use_buffer_dir = 0

" let g:codi#autocmd = "InsertLeave"
" let g:codi#virtual_text_prefix = "➡️ "
function! ToggleCodi()
    if !exists("b:codi_is_open") || !b:codi_is_open 
        let b:codi_is_open = 1
        echo "Starting Codi"
        execute 'Codi '.&filetype
    else
        let b:codi_is_open = 0
        echo "Stopping Codi"
        execute 'Codi!'
    endif
endfunction


" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope oldfiles<cr>
nnoremap <leader>'' <cmd>Telescope help_tags<cr>
nnoremap <leader>fG <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

lua require('plugins')
lua require('manutepowa')
set secure


