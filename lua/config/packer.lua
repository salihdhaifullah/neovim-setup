vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Telescope for fuzzy finding and more
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- for file tree
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }

    -- catppuccin colorscheme
    use { "catppuccin/nvim", as = "catppuccin" }


    -- to easily handle multiply buffers at once
    use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

    -- Treesitter for syntax highlighting and more
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Plenary for utility functions
    use 'nvim-lua/plenary.nvim'

    -- Null-ls for using Neovim as a language server
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Harpoon for quick navigation and terminal management
    use 'ThePrimeagen/harpoon'

    -- Undotree for visualizing the undo history
    use 'mbbill/undotree'

    -- Lsp-trouble for showing LSP diagnostics in a list
    use {
        'folke/lsp-trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Comment for easy commenting of code
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Fugitive for Git integration
    use 'tpope/vim-fugitive'

    -- Lsp-zero for LSP configuration and completion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'rafamadriz/friendly-snippets' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-buffer' },
        }
    }
end)
