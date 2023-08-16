require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c_sharp", "cpp", "css", "dockerfile",
        "graphql", "go", "gosum", "html", "http", "java", "json",
        "python", "prisma", "markdown", "javascript", "typescript", "c",
        "lua", "sql", "tsx", "vim", "vimdoc", "query" },

    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
