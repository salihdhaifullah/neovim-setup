local lspconfig = require("lspconfig")

lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig.util.default_config.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

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


lspconfig.emmet_language_server.setup({})
lspconfig.tailwindcss.setup({})
lspconfig.volar.setup({})
lspconfig.bashls.setup({})
lspconfig.csharp_ls.setup({})
lspconfig.css_variables.setup({})
lspconfig.dockerls.setup({})
lspconfig.pyright.setup({})
lspconfig.prismals.setup({})
lspconfig.gopls.setup({})

-- vscode builtin
lspconfig.eslint.setup({ capabilities = capabilities })
lspconfig.cssls.setup({ capabilities = capabilities })
lspconfig.html.setup({ capabilities = capabilities })
lspconfig.jsonls.setup({ capabilities = capabilities })


-- support for vue
local vue_plugin_path = os.getenv("PNPM_HOME") .. "/" .. "global/5/node_modules/@vue/typescript-plugin"
lspconfig.ts_ls.setup({
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

lspconfig.lua_ls.setup({
    on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
            return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

local function resetNSs(client_id)
    vim.validate({ client_id = { client_id, 'n' } })

    local client = vim.lsp.get_client_by_id(client_id)
    local server_id = vim.tbl_get((client or {}).server_capabilities, 'diagnosticProvider', 'identifier')

    local pull_ns_name = string.format('vim.lsp.%s.%d.%s', client and client.name or 'unknown', client_id,
        server_id or 'nil')
    local push_ns_name = string.format('vim.lsp.%s.%d', client and client.name or 'unknown', client_id)

    local pull_ns = vim.api.nvim_create_namespace(pull_ns_name)
    local push_ns = vim.api.nvim_create_namespace(push_ns_name)

    vim.diagnostic.reset(push_ns)
    vim.diagnostic.reset(pull_ns)
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = {
        "markdown", "text", "plaintext", "md", "html", "xml", "json", "yaml", "toml", "javascript", "typescript",
        "javascriptreact", "typescriptreact", "css", "scss", "less", "vue", "svelte", "go", "python", "lua",
        "c", "cpp", "java", "php", "ruby", "rust", "bash", "sh", "dockerfile", "sql", "NvimTree"
    },
    callback = function()
        vim.lsp.start({
            name = "cspell",
            cmd = { "cspell-lsp-wrapper", "--stdio" },
            root_dir = vim.fn.getcwd(),
            init_options = {
                home = vim.fn.stdpath('config')
            },
            handlers = {
                ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
                    if #result.diagnostics == 0 then
                        resetNSs(ctx.client_id)
                    else
                        vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
                    end
                end
            }
        })
    end,
})
