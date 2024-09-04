---
-- LSP configuration
---
local lspconfig = require('lspconfig')

-- Add cmp_nvim_lsp capabilities settings to lspconfig
lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- Executes the callback function every time a
-- language server is attached to a buffer.
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').emmet_language_server.setup({})
require('lspconfig').tailwindcss.setup({})
require('lspconfig').volar.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').csharp_ls.setup({})
require('lspconfig').css_variables.setup({})
require("lspconfig").dockerls.setup({})
require('lspconfig').pyright.setup({})
require('lspconfig').prismals.setup({})
require('lspconfig').gopls.setup({})
require('lspconfig').typos_lsp.setup({})

-- vscode builtin
require('lspconfig').eslint.setup({ capabilities = capabilities })
require('lspconfig').cssls.setup({ capabilities = capabilities })
require('lspconfig').html.setup({ capabilities = capabilities })
require('lspconfig').jsonls.setup({ capabilities = capabilities })


-- support for vue
local vue_plugin_path = os.getenv("PNPM_HOME").."/".."global/5/node_modules/@vue/typescript-plugin"
require('lspconfig').tsserver.setup({
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_plugin_path,
                languages = { "javascript", "typescript", "vue" },
            },
        },
    },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript", 
        "typescriptreact", 
        "typescript.tsx", 
        "vue"
    }
})
