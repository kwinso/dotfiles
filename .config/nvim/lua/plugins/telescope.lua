return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end
      },
    },
    config = function()
      local ts_actions = require "telescope.actions"
      require("telescope").setup {
        extensions = {
          file_browser = {
            files = true,
            hidden = true,
            depth = false,
            hide_parent_dir = true,
            collapse_dirs = true,
            respect_gitignore = true,
            follow_symlinks = true,
            add_dirs = false,
            cwd_to_path = true,

            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
          },
          mappings = {
            i = {
              ["<C-t>"] = ts_actions.select_tab,
            },
          }
        },
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              -- Swap next & back bind becuase it'll not go to the last item in telescope file browser
              ["<C-n>"] = ts_actions.move_selection_previous,
              ["<C-p>"] = ts_actions.move_selection_next,
              ["<C-d>"] = ts_actions.delete_buffer,
            },
            n = {
              ["D"] = ts_actions.delete_buffer,
            }
          },
        },
      }


      -- Enable telescope fzf native, if installed
      pcall(require('telescope').load_extension, 'fzf')
    end
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
}
