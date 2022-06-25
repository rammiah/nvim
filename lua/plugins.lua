local util = require("packer.util")
local use = require("packer").use
return require("packer").startup({
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- color theme
        use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
        use "overcache/NeoSolarized"
        use "NLKNguyen/papercolor-theme"
        use "mrtazz/molokai.vim"
        use "rakr/vim-one"
        use "folke/tokyonight.nvim"
        -- nvim tree
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons", -- optional, for file icon
            },
            tag = "nightly" -- optional, updated every week. (see issue 1193)
        }
        -- dev icons
        use "ryanoasis/vim-devicons"
        -- treesitter
        use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", requires = "p00f/nvim-ts-rainbow" }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        -- Lua
        -- use {
        --     "SmiteshP/nvim-gps",
        --     requires = "nvim-treesitter/nvim-treesitter"
        -- }
        -- commenter
        use 'numToStr/Comment.nvim'
        -- bufferline
        use { "akinsho/bufferline.nvim", tag = "*", requires = { "kyazdani42/nvim-web-devicons" } }
        -- go
        use { "rammiah/nvim-go", requires = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" } }
        use "rammiah/gocommand.vim"
        -- coc.nvim
        use { "neoclide/coc.nvim", branch = "release" }
        use "fannheyward/telescope-coc.nvim"
        -- auto pair
        use "windwp/nvim-autopairs"
        use "windwp/nvim-ts-autotag"
        -- surround
        use "tpope/vim-surround"
        use "tpope/vim-repeat"
        use { "ojroques/vim-oscyank", branch = "main" }
        -- suda sudo write
        use "lambdalisue/suda.vim"
        -- telescope and plugins
        use { "nvim-telescope/telescope.nvim", requires = {
            -- lazygit
            { "kdheepak/lazygit.nvim", requires = "nvim-lua/plenary.nvim" },
            -- funcs
            "nvim-lua/plenary.nvim",
            {
                -- fzf support
                "nvim-telescope/telescope-fzf-native.nvim", run = "make"
            },
            "nvim-lua/popup.nvim"
        } }
        -- neovim start time
        use "dstein64/vim-startuptime"
        -- git diff view
        use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
        -- git blame
        use "rammiah/git.nvim"
        -- git line signs, hunk previw and jump
        use "lewis6991/gitsigns.nvim"
        -- better filetype detect
        use "nathom/filetype.nvim"
        -- impatient to speed up vim
        use "lewis6991/impatient.nvim"
        -- todo comment list
        use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
        use { "AckslD/nvim-neoclip.lua", requires = {
            "nvim-telescope/telescope.nvim",
        },
        }
        -- float term
        -- use "voldikss/vim-floaterm"
        use { "akinsho/toggleterm.nvim", tag = 'v1.*' }
        -- lualine status line
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }
        -- icon picker
        use { "ziontee113/icon-picker.nvim", requires = "stevearc/dressing.nvim" }
        -- clipboard
        -- use "roxma/vim-tmux-clipboard"
        -- visual find
        use "nelstrom/vim-visual-star-search"
        -- substitute
        use "tpope/vim-abolish"

    end,
    config = {
        ensure_dependencies  = true, -- Should packer install plugin dependencies?
        snapshot             = nil, -- Name of the snapshot you would like to load at startup
        snapshot_path        = util.join_paths(vim.fn.stdpath("cache"), "packer.nvim"), -- Default save directory for snapshots
        package_root         = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
        compile_path         = util.join_paths(vim.fn.stdpath("config"), "plugin", "packer_compiled.lua"),
        plugin_package       = "packer", -- The default package for plugins
        max_jobs             = 7, -- Limit the number of simultaneous jobs. nil means no limit
        auto_clean           = true, -- During sync(), remove unused plugins
        compile_on_sync      = true, -- During sync(), run packer.compile()
        disable_commands     = false, -- Disable creating commands
        opt_default          = false, -- Default to using opt (as opposed to start) plugins
        transitive_opt       = true, -- Make dependencies of opt plugins also opt by default
        transitive_disable   = true, -- Automatically disable dependencies of disabled plugins
        auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
        display              = {
            open_fn = require("packer.util").float,
            working_sym = "⟳", -- The symbol for a plugin being installed/updated
            error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
            done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
            removed_sym = "-", -- The symbol for an unused plugin which was removed
            moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym = "━", -- The symbol for the header line in packer's display
            show_all_info = true, -- Should packer show all update details automatically?
            prompt_border = "double", -- Border style of prompt popups.
        },
        profile              = {
            enable = false,
            threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
        },
        log                  = {
            level = "info"
        },
    }

})
