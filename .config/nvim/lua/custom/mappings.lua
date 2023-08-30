local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dc"] = {
      function ()
        require("dapui").close()
      end,
      "Close DapUI"
    },
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Toggle Debug Breakpoint"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dr"] = {
      function()
        require('dap-python').test_method()
      end,
      "Run python debugger"
    }
  }
}

return M
