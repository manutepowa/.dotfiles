local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'glepnir/lspsaga.nvim'
  use 'wbthomason/packer.nvim'
  use {
    "tpope/vim-dadbod",
    opt = true,
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
      "tpope/vim-dotenv"
    },
    cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", },
  }

  use { 'lewis6991/impatient.nvim' }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { 'kyazdani42/nvim-web-devicons' }
    }
  }
  use { "ahmedkhalf/project.nvim" }

  --[[ use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0' } ]]
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  use { 'windwp/nvim-ts-autotag' }
  use { 'windwp/nvim-autopairs' }

  use { 'uga-rosa/translate.nvim' }

  -- Vim fugitive
  use 'tpope/vim-fugitive'
  use 'AchmadFathoni/vim-flog'
  use 'rhysd/git-messenger.vim'

  -- Themes
  use 'mhartington/oceanic-next'
  use 'lunarvim/darkplus.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Copilot
  use 'github/copilot.vim'

  -- Tabs
  use 'kyazdani42/nvim-web-devicons'
  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons' }

  -- Git Lines edited
  use 'lewis6991/gitsigns.nvim'

  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  -- PHP
  use 'lumiliet/vim-twig'

  -- MultiCursor
  use 'mg979/vim-visual-multi'

  use 'numToStr/Comment.nvim'
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Replace delete and change di', ci(
  use 'wellle/targets.vim'

  use 'antoinemadec/FixCursorHold.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'tpope/vim-surround' -- Surrounding ysw)
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly'                  -- optional, updated every week. (see issue #1193)
  }
  use 'norcalli/nvim-colorizer.lua'
  use 'ryanoasis/vim-devicons' -- Developer Icons
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
  })
  use "tpope/vim-repeat"
  use "RRethy/vim-illuminate"


  -- cmp plugins
  use 'hrsh7th/nvim-cmp'         -- The completion plugin
  use 'hrsh7th/cmp-buffer'       -- buffer completions
  use 'hrsh7th/cmp-path'         -- path completions
  use 'hrsh7th/cmp-cmdline'      -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  use "rcarriga/cmp-dap"

  -- Icons CMP
  use 'onsails/lspkind-nvim'

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "tamago324/nlsp-settings.nvim"    -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "filipdutescu/renamer.nvim"
  use "simrat39/symbols-outline.nvim"
  use { "folke/trouble.nvim" }

  use "ray-x/lsp_signature.nvim"
  use "jose-elias-alvarez/typescript.nvim"
  use "b0o/schemastore.nvim"

  -- snippets
  use 'L3MON4D3/LuaSnip'             --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- DAP
  use "mfussenegger/nvim-dap"
  use "theHamsta/nvim-dap-virtual-text"
  use { "rcarriga/nvim-dap-ui" }
  use "Pocco81/DAPInstall.nvim"

  use { "NTBBloodbath/rest.nvim", requires = { "nvim-lua/plenary.nvim" } }

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Markdown
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  -- Same that RunJS
  use { "metakirby5/codi.vim" }

  use { "moll/vim-bbye" }
  use {
    'jinh0/eyeliner.nvim',
    config = function()
      require 'eyeliner'.setup {
        highlight_on_key = true
      }
      vim.api.nvim_set_hl(0, 'EyelinerPrimary', { fg = '#FFFFFF', bold = true, underline = true })
      vim.api.nvim_set_hl(0, 'EyelinerSecondary', { fg = '#FFFFFF', underline = true })
    end
  }

  -- Kitty highlight
  use 'fladson/vim-kitty'
end)
