vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


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
        git_ignored = false,
    },
    actions = {
        open_file = {
            quit_on_open = true,
            window_picker = {
                enable = false
            },
        },
    },
})
vim.keymap.set("n", "<leader>a", ":NvimTreeToggle<CR>")
