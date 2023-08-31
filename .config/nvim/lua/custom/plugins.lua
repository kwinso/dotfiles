local overrides = require("custom.configs.overrides")

local plugins = {
  -- Mason Config
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },

  -- LSP Tools & such
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  -- Debuugger tools
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },

  -- Code context highligting 
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function (_, opts)
      require("core.utils").load_mappings("blankline")
      require('indent_blankline').setup(opts)
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    init = function ()
      require("core.utils").lazy_load "nvim-treesitter-context"
    end,
    config = function ()
      require("treesitter-context").setup()
    end,
  },

  -- Other packages
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
}
return plugins
