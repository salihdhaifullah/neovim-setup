require("bufferline").setup({
    options = {
        offsets = { { filetype = "NvimTree", text = "EXPLORER", text_align = "center" } }
    }
})


vim.keymap.set('n', '<leader>C', [[:lua CloseCurrentBuffer()<CR>]], { noremap = true, silent = true })

function CloseCurrentBuffer()
    -- Get the buffer number of the current buffer
    local current_buffer = vim.api.nvim_buf_get_number(0)

    -- Close the current buffer
    vim.cmd('bdelete')

    -- If the current buffer is unnamed and there are other buffers open, close it
    if vim.api.nvim_buf_is_loaded(current_buffer) and vim.api.nvim_buf_get_name(current_buffer) == '' then
        vim.cmd('bdelete ' .. current_buffer)
    end
end

vim.keymap.set('n', '<leader>C', ':enew<bar>bd #<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Tab>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<Bs>', '<CMD>BufferLineCyclePrev<CR>')
