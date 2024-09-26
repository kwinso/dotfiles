-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "gopls", "phpactor" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Used for specific LSP settings
local settings = {
  --go = {}
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  local setup = settings[lsp] or {}
  setup.on_attach = nvlsp.on_attach
  setup.on_init = nvlsp.on_init
  setup.capabilities = nvlsp.capabilities

  lspconfig[lsp].setup(setup)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
