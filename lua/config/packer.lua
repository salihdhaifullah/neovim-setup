vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- for vsocde snippet support and custom snippets
    use 'L3MON4D3/LuaSnip'

    -- Telescope for fuzzy finding and more
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2'
    }

    -- for file tree
    use { 'nvim-tree/nvim-tree.lua' }

    use { 'nvim-tree/nvim-web-devicons' }

    use 'Mofiqul/vscode.nvim'
    -- to easily handle multiply buffers at once
    use { 'akinsho/bufferline.nvim', tag = "*" }

    -- Treesitter for syntax highlighting and more
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Plenary for utility functions
    use 'nvim-lua/plenary.nvim'

    -- Undotree for visualizing the undo history
    use 'mbbill/undotree'

    -- Lsp-trouble for showing LSP diagnostics in a list
    use { 'folke/lsp-trouble.nvim' }

    -- Fugitive for Git integration
    use 'tpope/vim-fugitive'

    -- Lsp-zero for LSP configuration and completion
    use { 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' }
    use { 'neovim/nvim-lspconfig' }
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
end)
