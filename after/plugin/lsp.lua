-- install LSPs
-- os.execute('pnpm install -g @olrtg/emmet-language-server')
-- os.execute('pnpm install -g vscode-langservers-extracted')
-- os.execute('pnpm install -g @tailwindcss/language-server')
-- os.execute('pnpm install -g typescript typescript-language-server')
-- os.execute('pnpm install -g @vue/language-server')
-- os.execute('pnpm install -g bash-language-server')
-- os.execute('pnpm install -g css-variables-language-server')
-- os.execute('pnpm install -g vscode-langservers-extracted')
--
-- os.execute('dotnet tool install --global csharp-ls')

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
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').emmet_language_server.setup({})
require('lspconfig').eslint.setup({})
require('lspconfig').tailwindcss.setup({})

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
        "typescript",
        "vue",
    },
})


require('lspconfig').volar.setup({})
require('lspconfig').bashls.setup({})
require('lspconfig').csharp_ls.setup({})
require('lspconfig').css_variables.setup({})
require('lspconfig').cssls.setup({
  capabilities = capabilities,
})

---
-- Autocompletion setup
---
local cmp = require('cmp')

cmp.setup({
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    }),

    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },

    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

