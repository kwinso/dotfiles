return {
    servers = {
        -- I feel bad for this
        phpactor = {
            language_server_php_cs_fixer = {
                enabled = true
            }
        },

        svelte = {
            svelte = { plugin = { svelte = { defaultScriptLanguage = "ts" } } }
        },

        eslint = {},

        gopls = {
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    gofumpt = true,
                },
            },
        },
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

        --  JS tools
        prettier = {},

        -- PHP tools
        pint = {},
    },

    treesitter = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim',
        "svelte" }
}
