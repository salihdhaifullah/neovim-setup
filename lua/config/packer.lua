vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Telescope for fuzzy finding and more
    use 'nvim-telescope/telescope.nvim'
    
    -- Treesitter for syntax highlighting and more
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- for file tree
    use 'nvim-tree/nvim-tree.lua' 

    -- for file icons
    use 'nvim-tree/nvim-web-devicons' 

    -- to easily handle multiply buffers at once
    use 'akinsho/bufferline.nvim'

    -- theme
    use "EdenEast/nightfox.nvim"
    
    -- Undotree for visualizing the undo history
    use 'mbbill/undotree'

    -- Lsp-trouble for showing LSP diagnostics in a list
    use 'folke/lsp-trouble.nvim' 

    -- Fugitive for Git integration
    use 'tpope/vim-fugitive'

    -- lsp config
    use 'neovim/nvim-lspconfig' 
    
    -- auto complete
    use 'hrsh7th/nvim-cmp'
    
    -- auto complete from lsp
    use 'hrsh7th/cmp-nvim-lsp'
    
    -- auto complete from buffer
    use 'hrsh7th/cmp-buffer'
    
    -- auto complete from file system 
    use 'hrsh7th/cmp-path'
    
    -- auto complete from snippets 
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/cmp-vsnip'
end)
