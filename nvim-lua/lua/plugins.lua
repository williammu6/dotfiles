return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'sheerun/vim-polyglot'
    use 'luochen1990/rainbow'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'

    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'hrsh7th/cmp-nvim-lsp-signature-help'},
            {'hrsh7th/vim-vsnip'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'ntpeters/vim-better-whitespace'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-fugitive'
    use 'folke/tokyonight.nvim'
    use 'gruvbox-community/gruvbox'
    use 'chriskempson/base16-vim'

    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'sbdchd/neoformat'
    use 'github/copilot.vim'
end)

