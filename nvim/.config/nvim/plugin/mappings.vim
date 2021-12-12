let g:NERDTreeQuitOnOpen = 1
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1


" MultiCursor
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<S-M-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<S-M-n>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<S-M-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<S-M-k>'        " start selecting up