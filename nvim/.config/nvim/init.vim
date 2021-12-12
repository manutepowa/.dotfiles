set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set mouse=a
set clipboard=unnamedplus
set nowrap
set ignorecase
set completeopt-=preview " For No Previews
set backspace=indent,eol,start
set encoding=utf-8
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set scrolloff=5
set ttimeoutlen=50
set nofoldenable

so ~/.config/nvim/plugins.vim

let mapleader=" "

" Close Tag
" let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.js,*.twig'
" let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx,*.html,*.twig'
" let g:closetag_shortcut = '>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" normal mode:
nnoremap <c-j> 5j
nnoremap <c-k> 5k
" visual mode:
xnoremap <c-j> 5j
xnoremap <c-k> 5k


" MultiCursor
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<S-M-n>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<S-M-n>'           " replace visual C-n
let g:VM_maps["Select Cursor Down"] = '<S-M-j>'      " start selecting down
let g:VM_maps["Select Cursor Up"]   = '<S-M-k>'        " start selecting up

" noh - no highlight when search
map <esc> :noh <CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

inoremap kj <ESC>

let g:NERDTreeQuitOnOpen = 1
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Vim next window tab



" FZF Search
" TODO Como hacer que Ag sea solo del projecto
" nnoremap <Leader>ff :GFiles<CR>
" nnoremap <Leader>gg :Ag<CR>
" nnoremap <silent> <Leader>hh :History<CR>

" FixCursorHold for better performance
let g:cursorhold_updatetime = 100

" Theme
syntax on
set termguicolors
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" air-line
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeMapActivateNode='<TAB>'
let NERDTreeShowHidden=1


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


" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Move to previous/next
nnoremap <silent> <A-j> :BufferPrevious<CR>
nnoremap <silent> <A-k> :BufferNext<CR>
nnoremap <silent>    <A-c> :BufferClose<CR>


" No auto comment on new line
augroup NoAutoComment
  au!
  au FileType * setlocal formatoptions-=cro
augroup end

" COC SETTINGS
let g:coc_global_extensions = [
    		\ 'coc-json',
        	\ 'coc-tsserver',
        	\ 'coc-html',
        	\ 'coc-css',
			\ 'coc-eslint',
			\ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-tailwind-intellisense',
            \ 'coc-phpls',
            \ 'coc-emmet'
			\ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<C-j>" :
		  \ coc#refresh() 
inoremap <silent><expr> <C-k> 
          \ pumvisible() ? "\<C-p>" :
		  \ <SID>check_back_space() ? "\<C-k>" :
		  \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" 
" " Remap keys for applying codeAction to the current buffer.
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" Enable syntax for extensions
augroup filetypedetect
    au BufRead,BufNewFile *.module set filetype=php
    au BufRead,BufNewFile *.theme set filetype=php
augroup END


" Comment.nvim
lua << EOF
require('Comment').setup()
EOF


" Telescope Config
lua << EOF
require('telescope').setup {
  defaults = {
    prompt_prefix = "$ ",
    mappings = {
      i = { 
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    },
    layout_config = {
      horizontal = { width = 0.95 },
      preview_width = 0.4
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
EOF
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>hh <cmd>Telescope oldfiles<cr>
nnoremap <leader>'' <cmd>Telescope help_tags<cr>


" TreeSitter conf
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters
    max_file_lines = 1000,
  },
  ensure_installed = {
    "json",
    "html",
    "php",
    "javascript",
    "css",
    "scss",
    "typescript"
  }
}
EOF

