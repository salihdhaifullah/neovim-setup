local bufferline = require("bufferline")
bufferline.setup({
    options = {
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } }
    }
})


vim.o.hidden = false

vim.keymap.set('n', '<leader>C', [[:lua CloseCurrentBuffer()<CR>]], { noremap = true, silent = true })

function CloseCurrentBuffer()
    local length = #bufferline.get_elements().elements - 1

    vim.cmd('bdelete')
    if length > 0 then
        vim.cmd('bp')
    else
        vim.cmd('q')
        vim.cmd('NvimTreeFocus')
    end
end

vim.keymap.set('n', '<Tab>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<Bs>', '<CMD>BufferLineCyclePrev<CR>')
