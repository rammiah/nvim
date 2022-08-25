local util = require("packer.util")
local use = require("packer").use

return require("packer").startup({
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- color theme
        use "overcache/NeoSolarized"
        -- nvim tree
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons", -- optional, for file icon
            },
            -- tag = "nightly" -- optional, updated every week. (see issue 1193)
        }
        -- dev icons
        use "ryanoasis/vim-devicons"
        -- treesitter
        use { 
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = "p00f/nvim-ts-rainbow",
            -- commit = "635c450",
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
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
        use "kylechui/nvim-surround"
        use { "ojroques/vim-oscyank", branch = "main" }
        -- suda sudo write
        use "lambdalisue/suda.vim"
        -- telescope and plugins
        use { "nvim-telescope/telescope.nvim", requires = {
            -- lazygit
            -- { "kdheepak/lazygit.nvim", requires = "nvim-lua/plenary.nvim" },
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
        use { "akinsho/toggleterm.nvim" }
        -- lualine status line
        use {
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true }
        }
        -- clipboard
        -- use "roxma/vim-tmux-clipboard"
        -- visual find
        use "nelstrom/vim-visual-star-search"
        -- glow
        use { "ellisonleao/glow.nvim", branch = "main" }
        -- color
        use "norcalli/nvim-colorizer.lua"
        -- lastplace
        use "ethanholz/nvim-lastplace"
        -- key repeat
        use { "anuvyklack/hydra.nvim", requires = "anuvyklack/keymap-layer.nvim" }
        -- speed move
        use "phaazon/hop.nvim"
        -- copilot
        -- use "github/copilot.vim"
        -- sort
        use "sQVe/sort.nvim"
        -- translate
        -- use "potamides/pantran.nvim"
        -- auto session
        use "rmagatti/auto-session"
        -- hardtime
        -- use "takac/vim-hardtime"
        -- comma text object
        use "austintaylor/vim-commaobject"
        -- dap
        use "mfussenegger/nvim-dap"
        use {
            "theHamsta/nvim-dap-virtual-text",
            config = function()
                require("nvim-dap-virtual-text").setup {
                    enabled = true, -- enable this plugin (the default)
                    enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
                    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
                    highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
                    show_stop_reason = true, -- show stop reason when stopped for exceptions
                    commented = false, -- prefix virtual text with comment string
                    only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
                    all_references = false, -- show virtual text on all all references of the variable (not only definitions)
                    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
                    -- experimental features:
                    virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
                    all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
                    virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
                    virt_text_win_col = nil -- position the virtual text at a fixed window column (starting from the first text column) ,
                    -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
                }

            end
        }
        use {
            "leoluz/nvim-dap-go",
            -- as = "dap-go",
            -- opt = true,
        }
        use {
            "mfussenegger/nvim-dap-python",
            -- as = "dap-python",
            -- opt = true,
        }

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
        git                  = {
            cmd = "git", -- The base command for git operations
            subcommands = { -- Format strings for git subcommands
                update         = "pull --ff-only --progress --rebase=false --tags --force",
                install        = "clone --depth %i --no-single-branch --progress",
                fetch          = "fetch --depth 999999 --progress",
                checkout       = "checkout %s --",
                update_branch  = "merge --ff-only @{u}",
                current_branch = "branch --show-current",
                diff           = "log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD",
                diff_fmt       = "%%h %%s (%%cr)",
                get_rev        = "rev-parse --short HEAD",
                get_msg        = "log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1",
                submodules     = "submodule update --init --recursive --progress",
            },
            depth = 1, -- Git clone depth
            clone_timeout = 60, -- Timeout, in seconds, for git clones
            default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
        },
        display              = {
            open_fn = require("packer.util").float,
            working_sym = "", -- The symbol for a plugin being installed/updated
            error_sym = "✗", -- The symbol for a plugin with an error in installation/updating
            done_sym = "✓", -- The symbol for a plugin which has completed installation/updating
            removed_sym = "", -- The symbol for an unused plugin which was removed
            moved_sym = "→", -- The symbol for a plugin which was moved (e.g. from opt to start)
            header_sym = "━", -- The symbol for the header line in packer's display
            show_all_info = true, -- Should packer show all update details automatically?
            prompt_border = "single", -- Border style of prompt popups.
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
