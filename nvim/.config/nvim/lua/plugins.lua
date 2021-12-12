vim.cmd [[packadd packer.nvim]]
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'ThePrimeagen/refactoring.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'}
        }
    }

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-refactor' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }


    use 'tpope/vim-dispatch'

    -- Completition
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "onsails/lspkind-nvim"
    use "hrsh7th/cmp-nvim-lsp-signature-help"
    use "windwp/nvim-autopairs"


    use "ray-x/lsp_signature.nvim"

    use "tjdevries/colorbuddy.nvim"

    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }

    use 'L3MON4D3/LuaSnip'

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim'},
            { 'nvim-lua/popup.nvim' },
            { 'nvim-telescope/telescope-fzy-native.nvim' },
            { 'kyazdani42/nvim-web-devicons' }
        }
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use {
        'puremourning/vimspector',
        requires = {
            { 'mfussenegger/nvim-dap' }
        },
        fn = "vimspector#Launch",
    }

    use 'szw/vim-maximizer'

    use 'vim-test/vim-test'

    use {
        'noahfrederick/vim-laravel',
        requires = {
            { 'tpope/vim-projectionist' },
            { 'noahfrederick/vim-composer' }
        }
    }

    use 'dracula/vim'
    use 'mhartington/oceanic-next'

    use 'Raimondi/delimitMate'
    use 'tpope/vim-surround'
    use 'tpope/vim-dotenv'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'tpope/vim-obsession'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-commentary'
    use 'airblade/vim-gitgutter'


    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-ui'

    use 'ggandor/lightspeed.nvim'

    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'preservim/nerdtree',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'mg979/vim-visual-multi'
end)
