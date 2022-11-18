local util = require("packer.util")
local use = require("packer").use

return require("packer").startup({
    function()
        -- Packer can manage itself
        use "wbthomason/packer.nvim"
        -- color theme
        use "overcache/NeoSolarized"
        use { "ellisonleao/gruvbox.nvim" }
        -- dev icons
        use {
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup {
                    override = {
                        TelescopePrompt = {
                            icon = " ",
                            color = "#428850",
                            cterm_color = "65",
                            name = "Telescope"
                        },
                    };
                    color_icons = true;
                    default = true;
                }
            end,
        }
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
        -- treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            requires = {
                "p00f/nvim-ts-rainbow",
                "nvim-treesitter/nvim-treesitter-textobjects",
                "JoosepAlviste/nvim-ts-context-commentstring",
                "RRethy/nvim-treesitter-endwise",
            },
            -- commit = "635c450",
            config = function()
                require("plugin-config.nvim-treesitter")
            end,
        }
        use "nvim-treesitter/playground"
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
        use {
            "rammiah/nvim-go",
            requires = {
                "nvim-lua/plenary.nvim",
                "rcarriga/nvim-notify",
            },
            config = function()
                require("plugin-config.nvim-go")
            end,
        }
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
        -- yank
        use {
            "ojroques/vim-oscyank",
            branch = "main",
            config = function()
                vim.api.nvim_create_autocmd("TextYankPost", {
                    desc = "send text by osc32",
                    command = [[if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif]],
                    pattern = "*",
                })
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
        use {
            "dinhhuy258/git.nvim",
            config = function()
                require("plugin-config.git")
            end
        }
        -- git line signs, hunk previw and jump
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("plugin-config.gitsigns")
            end
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
        -- use {
        --     "anuvyklack/hydra.nvim",
        --     requires = "anuvyklack/keymap-layer.nvim",
        --     config = function()
        --         require("plugin-config.hydra")
        --     end
        -- }
        -- speed move
        use {
            "phaazon/hop.nvim",
            config = function()
                require("plugin-config.hop")
            end
        }
        -- sort
        use {
            "sQVe/sort.nvim",
            config = function()
                require("plugin-config.sort")
            end,
        }
        -- auto session
        use {
            "rmagatti/auto-session",
            config = function()
                require("plugin-config.auto-sess")
            end
        }
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
        -- tab scope buffers
        use {
            "tiagovla/scope.nvim",
            config = function()
                require("scope").setup {}
            end,
        }
        -- cursor line mode colors
        use {
            "mvllow/modes.nvim",
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
                    ignore_filetypes = { "NvimTree", "TelescopePrompt" },
                }
            end,
        }
        -- zen-mode
        use {
            "folke/zen-mode.nvim",
            config = function()
                require("plugin-config.zen-mode")
            end,
        }
        use {
            "Pocco81/true-zen.nvim",
            config = function()
                require("plugin-config.true-zen")
            end
        }
        -- command result real time
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
        -- jsonpath
        use "phelipetls/jsonpath.nvim"
        -- nvim-cmp for cmdline
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/cmp-buffer"
        use "onsails/lspkind.nvim"
        use { "tzachar/cmp-fuzzy-path", requires = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } }
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require("plugin-config.cmp")
            end
        }
        -- orgmode
        use {
            "nvim-orgmode/orgmode",
            config = function()
                require("orgmode").setup {}
                require("orgmode").setup_ts_grammar {}
            end,
        }
        -- toggle bool, words
        use {
            "nguyenvukhang/nvim-toggler",
            config = function()
                require("plugin-config.toggler")
            end
        }
        -- real time line number
        use {
            "nacro90/numb.nvim",
            config = function()
                require("numb").setup {
                    show_numbers = true, -- Enable 'number' for the window while peeking
                    show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                    hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
                    number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
                    centered_peeking = true, -- Peeked line will be centered relative to window
                }
            end,
        }
        -- markdown preview
        use {
            "iamcco/markdown-preview.nvim",
            run = "cd app && yarn install --frozen-lock-file",
            setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
            config = function()
                require("plugin-config.markdown_preview")
            end,
            opt = true,
            ft = {
                "markdown"
            },
        }
        use {
            "anuvyklack/help-vsplit.nvim",
            config = function()
                require("help-vsplit").setup {
                    always = false, -- Always open help in a vertical split.
                    side = "right", -- 'left' or 'right'
                    buftype = { "help" },
                    filetype = { "man" }
                }
            end,
        }
        use {
            "tjdevries/colorbuddy.nvim",
            config = function()
                local Color, colors, Group, groups, styles = require("colorbuddy").setup()
            end
        }
        use {
            "mbbill/undotree",
            config = function()
                vim.g.undotree_WindowLayout = 3
                vim.g.undotree_DiffAutoOpen = 1
                vim.g.undotree_SetFocusWhenToggle = 1
                vim.g.undotree_DiffCommand = "delta"
                vim.g.undotree_ShortIndicators = 1
            end,
        }
        -- better fold
        use {
            "anuvyklack/pretty-fold.nvim",
            config = function()
                require("plugin-config.pretty-fold")
            end
        }
        use {
            "anuvyklack/fold-preview.nvim",
            requires = {
                "anuvyklack/keymap-amend.nvim",
            },
            config = function()
                require("fold-preview").setup {
                    default_keybindings = true,
                    boder = "single",
                }
                local keymap = vim.keymap
                keymap.amend = require("keymap-amend")
                local map = require("fold-preview").mapping

                keymap.amend("n", "h", map.show_close_preview_open_fold)
                keymap.amend("n", "l", map.close_preview_open_fold)
                keymap.amend("n", "zo", map.close_preview)
                keymap.amend("n", "zO", map.close_preview)
                keymap.amend("n", "zc", map.close_preview_without_defer)
                keymap.amend("n", "zR", map.close_preview)
                keymap.amend("n", "zM", map.close_preview_without_defer)
            end
        }
        use {
            "itchyny/calendar.vim",
            config = function()
                vim.g.calendar_google_calendar = 0
                vim.g.calendar_google_task = 0
            end
        }
        use {
            "ThePrimeagen/vim-be-good",
            config = function()
                -- vim.g.vim_be_good_delete_me_offset = 35
            end
        }
        use {
            "uga-rosa/translate.nvim",
            config = function()
                require("translate").setup {
                    default = {
                        command = "google",
                    },
                }
            end,
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
            default_url_format = "https://github.com/%s" -- Lua format string used for "aaa/bbb" style plugins
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
