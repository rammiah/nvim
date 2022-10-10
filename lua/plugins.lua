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
            config = function()
                require("plugin-config.nvim-tree")
            end,
        }
        -- dev icons
        use "ryanoasis/vim-devicons"
        -- treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = "p00f/nvim-ts-rainbow",
            -- commit = "635c450",
            config = function()
                require("plugin-config.nvim-treesitter")
            end,
        }
        use "nvim-treesitter/nvim-treesitter-textobjects"
        use "JoosepAlviste/nvim-ts-context-commentstring"
        use "nvim-treesitter/playground"
        -- Lua
        -- use {
        --     "SmiteshP/nvim-gps",
        --     requires = "nvim-treesitter/nvim-treesitter"
        -- }
        -- commenter
        use {
            "numToStr/Comment.nvim",
            config = function()
                require("plugin-config.comment")
            end,
        }
        -- bufferline
        use {
            "akinsho/bufferline.nvim",
            tag = "*",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugin-config.bufferline")
            end,
        }
        -- go
        use { "rammiah/nvim-go", requires = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" } }
        use "rammiah/gocommand.vim"
        use {
            "rcarriga/nvim-notify",
            config = function()
                require("plugin-config.notify")
            end,
        }
        -- coc.nvim
        use {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                require("plugin-config.coc")
            end
        }
        -- auto pair
        use {
            "windwp/nvim-autopairs",
            config = function()
                require("plugin-config.autopairs")
            end,
        }
        use {
            "windwp/nvim-ts-autotag",
            config = function()
                require("plugin-config.autotag")
            end,
        }
        -- surround
        use {
            "kylechui/nvim-surround",
            config = function()
                require("plugin-config.surround")
            end,
        }
        use { "ojroques/vim-oscyank",
            branch = "main",
            config = function()
                vim.cmd [[ autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif ]]
                vim.g.oscyank_silent = true
                vim.g.oscyank_term = "default"
            end,
        }
        -- suda sudo write
        use {
            "lambdalisue/suda.vim",
            config = function()
                vim.g.suda_smart_edit = 0
                vim.g["suda#prompt"] = "password: "
            end
        }
        -- telescope and plugins
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                {
                    -- fzf support
                    "nvim-telescope/telescope-fzf-native.nvim", run = "make"
                },
                "nvim-lua/popup.nvim",
                "nvim-telescope/telescope-hop.nvim",
                "fannheyward/telescope-coc.nvim",
            },
            config = function()
                require("plugin-config.telescope-conf")
            end,
        }
        -- neovim start time
        use "dstein64/vim-startuptime"
        -- git diff view
        use {
            "sindrets/diffview.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("plugin-config.diffview")
            end,
        }
        -- git blame
        use "dinhhuy258/git.nvim"
        -- git line signs, hunk previw and jump
        use "lewis6991/gitsigns.nvim"
        -- better filetype detect
        use {
            "nathom/filetype.nvim",
            config = function()
                require("plugin-config.filetype")
            end,
        }
        -- impatient to speed up vim
        use "lewis6991/impatient.nvim"
        -- todo comment list
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("plugin-config.todo-comments")
            end,
        }
        -- toggleterm
        use {
            "akinsho/toggleterm.nvim",
            config = function()
                require("plugin-config.toggleterm")
            end,
        }
        -- lualine status line
        use {
            "nvim-lualine/lualine.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("plugin-config.lualine")
            end,
        }
        -- glow
        use { "ellisonleao/glow.nvim",
            branch = "main",
            config = function()
                vim.g.glow_border = "rounded"
                vim.g.glow_width = 120
                vim.g.glow_use_pager = true
                vim.g.glow_style = "light"
            end,
        }
        -- color
        -- use "norcalli/nvim-colorizer.lua"
        use {
            "uga-rosa/ccc.nvim",
            branch = "0.7.2",
            config = function()
                require("ccc").setup {
                    highlighter = {
                        auto_enable = true,
                        filetypes = {},
                        excludes = {},
                        events = { "WinScrolled", "TextChanged", "TextChangedI" },
                    },
                }
            end
        }
        -- lastplace
        use {
            "ethanholz/nvim-lastplace",
            config = function()
                require "nvim-lastplace".setup {
                    lastplace_ignore_buftype = { "quickfix", "nofile", "help", "NvimTree" },
                    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit", "NvimTree" },
                    lastplace_open_folds = true,
                }
            end,
        }
        -- key repeat
        use { "anuvyklack/hydra.nvim", requires = "anuvyklack/keymap-layer.nvim" }
        -- speed move
        use "phaazon/hop.nvim"
        -- sort
        use {
            "sQVe/sort.nvim",
            config = function()
                require("plugin-config.sort")
            end,
        }
        -- auto session
        use "rmagatti/auto-session"
        -- comma text object
        use "austintaylor/vim-commaobject"
        -- vim thrift syntax
        use "solarnz/thrift.vim"
        -- stay in place format
        use {
            "gbprod/stay-in-place.nvim",
            config = function()
                require("stay-in-place").setup {
                    set_keymaps = true,
                    preserve_visual_selection = true,
                }
            end,
        }
        use {
            "tiagovla/scope.nvim",
            config = function()
                require("scope").setup()
            end,
        }
        use {
            'mvllow/modes.nvim',
            -- tag = 'v0.2.0',
            config = function()
                require("modes").setup {
                    colors = {
                        copy = "#f5c359",
                        delete = "#dc322f",
                        insert = "#859900",
                        visual = "#d33682",
                    },
                    -- Set opacity for cursorline and number background
                    line_opacity = 0.2,
                    -- Enable cursor highlights
                    set_cursor = true,
                    -- Enable cursorline initially, and disable cursorline for inactive windows
                    -- or ignored filetypes
                    set_cursorline = true,
                    -- Enable line number highlights to match cursorline
                    set_number = true,
                    -- Disable modes highlights in specified filetypes
                    -- Please PR commonly ignored filetypes
                    ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
                }
            end,
        }
        use {
            "folke/zen-mode.nvim",
            config = function()
                require("plugin-config.zen-mode")
            end,
        }
        use {
            "smjonas/live-command.nvim",
            config = function()
                require("live-command").setup {
                    commands = {
                        Norm = { cmd = "norm" },
                        G = { cmd = "g" },
                    },
                    defaults = {
                        enable_highlighting = true,
                        inline_highlighting = true,
                        hl_groups = {
                            insertion = "DiffAdd",
                            deletion = "DiffDelete",
                            change = "DiffChange",
                        },
                        debug = false,
                    },
                }
            end
        }
        use  "phelipetls/jsonpath.nvim"
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
