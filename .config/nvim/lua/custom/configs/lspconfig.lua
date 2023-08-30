local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.max_width = 120
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportGeneralTypeIssues = "information",
        }
      }
    }
  }
})
