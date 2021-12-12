
call plug#begin()
" telescope search
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'

" Vim fugitive
Plug 'tpope/vim-fugitive'

" Themes
Plug 'mhartington/oceanic-next'

" Copilot
Plug 'github/copilot.vim'

" Tabs
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Git Lines edited
Plug 'mhinz/vim-signify'

" PHP
Plug 'lumiliet/vim-twig', {'for': 'twig'} " twig

" MultiCursor
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'numToStr/Comment.nvim'

" Replace delete and change di', ci(
Plug 'wellle/targets.vim'

Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine' " Indent lines
" Plug 'alvan/vim-closetag' " Close Tag
" Plug 'windwp/nvim-ts-autotag'
Plug 'jiangmiao/auto-pairs' " Close automatically brackets
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'preservim/nerdtree' " NerdTree
Plug 'vim-airline/vim-airline' " Status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'neoclide/coc.nvim'  " Auto Completion
Plug 'ryanoasis/vim-devicons' " Developer Icons

" Syntax highlighting
Plug 'pangloss/vim-javascript'

call plug#end()

