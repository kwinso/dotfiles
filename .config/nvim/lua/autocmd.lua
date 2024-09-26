-- Enables auto-formatting
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
