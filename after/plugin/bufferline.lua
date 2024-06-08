require('bufferline').setup({
    highlights = {
        fill = {
            guifg = '#ffffff',
            guibg = '#1e1e2e',
        },
        background = {
            guifg = '#ffffff',
            guibg = '#ffffff',
        },
        buffer_selected = {
            guifg = '#ffffff',
            guibg = '#3b4252',
            gui = 'bold',
        },
        separator_selected = {
            guifg = '#3b4252',
            guibg = '#1e1e2e',
        },
        separator_visible = {
            guifg = '#1e1e2e',
            guibg = '#1e1e2e',
        },
        separator = {
            guifg = '#1e1e2e',
            guibg = '#1e1e2e',
        },
        diagnostic_selected = { bold = true },
        info_selected = { bold = true },
        info_diagnostic_selected = { bold = true },
        warning_selected = { bold = true },
        warning_diagnostic_selected = { bold = true },
        error_selected = { bold = true },
        error_diagnostic_selected = { bold = true },
    },
    options = {
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        max_prefix_length = 8,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
                return ''
            end
            if level:match('error') then
                return ' ' .. vim.g.diagnostic_icons.Error
            elseif level:match('warning') then
                return ' ' .. vim.g.diagnostic_icons.Warning
            end
            return ''
        end,
        custom_filter = function(buf_number, buf_numbers)
            if vim.bo[buf_number].filetype ~= 'oil' then
                return true
            end
        end,
    },
})

vim.keymap.set('n', '<leader>ts', '<CMD>BufferLinePickClose<CR>')
vim.keymap.set('n', '<Tab>', '<CMD>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<Bs>', '<CMD>BufferLineCyclePrev<CR>')

