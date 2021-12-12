vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'kyazdani42/nvim-web-devicons' },
			{ 'junegunn/fzf' },
			{ 'junegunn/fzf.vim' },
        }
    }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use 'p00f/nvim-ts-rainbow'

	-- Vim fugitive
	use 'tpope/vim-fugitive'

	-- Themes
	use 'mhartington/oceanic-next'

	-- Copilot
	use 'github/copilot.vim'

	-- Tabs
	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'

	-- Git Lines edited
	use 'mhinz/vim-signify'

	-- PHP
	use { 'lumiliet/vim-twig', { for = 'twig'}}

	-- MultiCursor
	use {'mg979/vim-visual-multi', {branch = 'master'}}

	use 'numToStr/Comment.nvim'

	-- Replace delete and change di', ci(
	use 'wellle/targets.vim'

	use 'antoinemadec/FixCursorHold.nvim'
	use 'mattn/emmet-vim'
	use 'Yggdroot/indentLine' -- Indent lines
	-- use 'alvan/vim-closetag' -- Close Tag
	-- use 'windwp/nvim-ts-autotag'
	use 'jiangmiao/auto-pairs' -- Close automatically brackets
	use 'sheerun/vim-polyglot' -- A collection of language packs for Vim
	use 'tpope/vim-surround' -- Surrounding ysw)
	use 'preservim/nerdtree' -- NerdTree
	use 'vim-airline/vim-airline' -- Status bar
	use 'ap/vim-css-color' -- CSS Color Preview
	use 'neoclide/coc.nvim'  -- Auto Completion
	use 'ryanoasis/vim-devicons' -- Developer Icons

	-- Syntax highlighting
	use 'pangloss/vim-javascript'

end)
