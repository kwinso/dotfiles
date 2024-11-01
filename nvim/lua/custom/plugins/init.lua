-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Oil file viewer
  {
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

  -- Supermaven
  {
    {
      'supermaven-inc/supermaven-nvim',
      lazy = false,
      opts = {
        keymaps = {
          accept_suggestion = '<A-f>',
        },
        color = {
          suggestion_color = '#808080',
          cterm = 244,
        },
      },
    },
  },

  -- Tmux nav
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'davidmh/mdx.nvim',
    event = 'BufEnter *.mdx',
    config = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
