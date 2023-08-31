vim.wo.relativenumber = true
vim.api.nvim_set_option_value("colorcolumn", "80", {})

---@type ChadrcConfig 
local M = {}
M.ui = {theme = 'catppuccin'}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
