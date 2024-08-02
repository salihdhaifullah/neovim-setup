vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<C-q>", ":ccl<CR>")

vim.keymap.set('n', '<leader>R', ':<C-U>lua ReplaceVisual()<CR>')

function ReplaceVisual()
    local selected_text = vim.fn.escape(vim.fn.getreg('"'), '\\/.*$^~[]')
    local replacement = vim.fn.escape(vim.fn.input("Enter replacement: "), '\\/.*$^~[]')
    vim.api.nvim_command(":s/" .. selected_text .. "/" .. replacement .. "/g")
end


vim.keymap.set('n', '<C-R>', ':<C-U>lua ReplaceGlobalVisual()<CR>')

function ReplaceGlobalVisual()
    local selected_text = vim.fn.escape(vim.fn.getreg('"'), '\\/.*$^~[]')
    local replacement = vim.fn.escape(vim.fn.input("Enter replacement: "), '\\/.*$^~[]')
    vim.api.nvim_command(":%s/" .. selected_text .. "/" .. replacement .. "/g")
end

vim.keymap.set("i", "<C-c>", "<Esc>")


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
