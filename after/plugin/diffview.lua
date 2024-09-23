require("diffview").setup()

vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>")

