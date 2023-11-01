return {
    servers = {
        gopls = {},
        html = { filetypes = { 'html', 'twig', 'hbs' } },

        rust_analyzer = {},
        tsserver = {},
        clangd = {},
        pyright = {
            python = {
                analysys = {
                    autoImportCompletions = true
                }
            }
        },
        lua_ls = {
            Lua = {
                workspace = { checkThirdParty = false },
                telemetry = { enable = false },
            },
        },
    },

    -- Other tools that are not LSP servers (linters, formatters, etc.)
    tools = {
        -- Python tools
        black = {},
        ruff = {},
        mypy = {},
    }
}
