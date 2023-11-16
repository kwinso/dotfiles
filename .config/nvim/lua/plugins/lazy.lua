-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more ifo
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)


require('lazy').setup({
    -- NOTE: First, some plugins that don't require any configuration

    -- Git related plugins
    -- 'tpope/vim-fugitive',
    -- 'tpope/vim-rhubarb',

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- "gc" to comment visual regions/lines
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },

    -- Useful plugin to show you pending keybinds.
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').register()
        end,
    },

    {
        "olexsmir/gopher.nvim",
        ft = "go",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        main = "ibl",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        opts = {
            indent = {
                char = '┊',
            }
        },
    },

    require("plugins.null_ls"),
    require("plugins.debug"),
    require("plugins.gitsigns"),
    require("plugins.lsp"),
    require("plugins.cmp"),
    require("plugins.treesitter"),

    -- Custom plugins
    { import = 'plugins.telescope' },
    { import = 'plugins.appearance' },
}, {})
