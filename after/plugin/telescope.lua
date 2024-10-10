local builtin = require('telescope.builtin')
require('telescope').setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')



local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"


local buffers
buffers = function(_)
    builtin.buffers({
        attach_mappings = function(prompt_bufnr, map)
            map('i', 'dd', function()
                local selection = action_state.get_selected_entry()
                if selection then
                    vim.api.nvim_buf_delete(selection.bufnr, { force = true })
                    actions.close(prompt_bufnr)
                    buffers()
                end
            end)

            return true
        end,
    })
end

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>pb', buffers, { desc = 'Telescope buffers with delete' })
vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope git files' })
vim.keymap.set('n', '<leader>h', builtin.keymaps, { desc = 'Search Keymaps' })
vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Search Resume' })
vim.keymap.set('n', '<leader>t', "<cmd>TodoTelescope<CR>", { desc = 'Find comments' })
