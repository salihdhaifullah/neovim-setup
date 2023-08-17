local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

local function remove_current_buffer()
    local bufname = vim.fn.expand("%")
    local idx = mark.get_index_of(bufname)
    if idx then
        mark.rm_file(idx)
        mark.remove_empty_tail(idx)
        vim.notify("Removed: " .. bufname)
    else
        vim.notify("No mark found for: " .. bufname)
    end
end

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-m>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-z>", ui.nav_next)
vim.keymap.set("n", "<C-x>", ui.nav_prev)

vim.keymap.set("n", "<leader>rf", remove_current_buffer)
