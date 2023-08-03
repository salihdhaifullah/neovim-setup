vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<C-J>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-K>", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("n", "N", "Nzzzv")

function Copy_last_message()
    local messages = vim.api.nvim_exec("messages", true)
    local lines = vim.split(messages, "\n")
    local last_message = ""

    for i = #lines, 1, -1 do
        if lines[i] ~= "" then
            last_message = lines[i]
            break
        end
    end

    vim.fn.setreg('*', last_message)
    vim.fn.setreg('+', last_message)
end

vim.keymap.set("n", "<leader>e", "<cmd>lua Copy_last_message()<CR>", { noremap = true })
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
