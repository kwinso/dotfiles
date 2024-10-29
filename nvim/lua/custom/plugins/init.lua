-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    -- Oil file viewer
    'refractalize/oil-git-status.nvim',
    dependencies = { 'stevearc/oil.nvim', 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {},
    config = function()
      require('oil').setup {
        win_options = {
          signcolumn = 'yes:2',
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
      }
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      require('oil-git-status').setup {
        show_ignored = true,
      }
    end,
  },
}
