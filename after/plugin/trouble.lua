require("trouble").setup {}

vim.keymap.set('n', '<leader>x', '<cmd>Trouble diagnostics toggle<cr>', { noremap = true, silent = true })
