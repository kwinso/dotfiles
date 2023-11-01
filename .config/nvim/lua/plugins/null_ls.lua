return {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    config = function()
        local null_ls = require("null-ls")
        -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        null_ls.setup({
            root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy.with({
                    extra_args = function()
                        local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
                        return {
                            "--python-executable", virtual .. "/bin/python3", -- Overriding python3 executable
                            "--ignore-missing-imports",
                        }
                    end,
                }),
                null_ls.builtins.diagnostics.ruff,
            },

            -- Setup formatting on save
            -- on_attach = function(client, bufnr)
            -- 	if client.name == "null-ls" and client.supports_method("textDocument/formatting") then
            -- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            -- 		vim.api.nvim_create_autocmd("BufWritePre", {
            -- 			group = augroup,
            -- 			buffer = bufnr,
            -- 			callback = function()
            -- 				vim.lsp.buf.format({ bufnr = bufnr })
            -- 			end
            -- 		})
            -- 	end
            -- end,
        })
    end,
}
