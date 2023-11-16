-- Theme inspired by Atom
return {
  {

    'navarasu/onedark.nvim',
    priority = 1000,
    opts = {
      style = "darker",
      transparent = true,
    },
    config = function(_, opts)
      require('onedark').setup(opts)
      vim.cmd.colorscheme 'onedark'
    end,
  },
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          }
        }
      }
    },
  }
}
