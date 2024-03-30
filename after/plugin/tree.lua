vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- :NvimTreeToggle Open or close the tree. Takes an optional path argument.
--
-- :NvimTreeFocus Open the tree if it is closed, and then focus on the tree.
--
-- :NvimTreeFindFile Move the cursor in the tree for the current buffer, opening folders if needed.
--
-- :NvimTreeCollapse Collapses the nvim-tree recursively.

require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>tff", ":NvimTreeFindFile<CR>")


-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--
-- vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")
--
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
--
-- vim.keymap.set("n", "N", "Nzzzv")
--
-- vim.keymap.set("n", "<C-q>", ":ccl<CR>")
--
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
--
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
-- vim.keymap.set("i", "<C-c>", "<Esc>")
--
-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

