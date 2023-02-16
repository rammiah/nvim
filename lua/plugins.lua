local opts = {
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "single",
    },
}

require("lazy").setup({
    -- Packer can manage itself
    -- color theme
    "overcache/NeoSolarized",
    "nvim-lua/plenary.nvim",
    -- use { "ellisonleao/gruvbox.nvim" }
    -- dev icons
    {
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
    },
    -- nvim tree
    {
        "kyazdani42/nvim-tree.lua",
        dependencies = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        -- tag = "nightly" -- optional, updated every week. (see issue 1193)
        config = function()
            require("plugin-config.nvim-tree")
        end,
    },
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "p00f/nvim-ts-rainbow",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "JoosepAlviste/nvim-ts-context-commentstring",
            "RRethy/nvim-treesitter-endwise",
        },
        -- commit = "635c450",
        config = function()
            require("plugin-config.nvim-treesitter")
        end,
    },
    "nvim-treesitter/playground",
    -- commenter
    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugin-config.comment")
        end,
    },
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugin-config.bufferline")
        end,
    },
    -- go
    {
        "rammiah/nvim-go",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("plugin-config.nvim-go")
        end,
    },
    "rammiah/gocommand.vim",
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugin-config.notify")
        end,
    },
    -- coc.nvim
    {
        "neoclide/coc.nvim",
        branch = "release",
        config = function()
            require("plugin-config.coc")
        end
    },
    -- auto pair
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugin-config.autopairs")
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("plugin-config.autotag")
        end,
    },
    -- surround
    {
        "kylechui/nvim-surround",
        config = function()
            require("plugin-config.surround")
        end,
    },
    -- yank
    {
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
    },
    -- suda sudo write
    {
        "lambdalisue/suda.vim",
        config = function()
            vim.g.suda_smart_edit = 0
            vim.g["suda#prompt"] = "password: "
        end
    },
    -- telescope and plugins
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                -- fzf support
                "nvim-telescope/telescope-fzf-native.nvim", build = "make"
            },
            "nvim-lua/popup.nvim",
            "nvim-telescope/telescope-hop.nvim",
            "fannheyward/telescope-coc.nvim",
        },
        config = function()
            require("plugin-config.telescope-conf")
        end,
    },
    -- neovim start time
    "dstein64/vim-startuptime",
    -- git diff view
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugin-config.diffview")
        end,
    },
    -- git blame
    {
        "dinhhuy258/git.nvim",
        config = function()
            require("plugin-config.git")
        end
    },
    -- git line signs, hunk previw and jump
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugin-config.gitsigns")
        end
    },
    -- impatient to speed up vim
    -- use "lewis6991/impatient.nvim"
    -- todo comment list
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugin-config.todo-comments")
        end,
    },
    -- toggleterm
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("plugin-config.toggleterm")
        end,
    },
    -- lualine status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
            require("plugin-config.lualine")
        end,
    },
    {
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
    },
    -- lastplace
    {
        "ethanholz/nvim-lastplace",
        config = function()
            require "nvim-lastplace".setup {
                lastplace_ignore_buftype = { "quickfix", "nofile", "help", "NvimTree" },
                lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit", "NvimTree" },
                lastplace_open_folds = true,
            }
        end,
    },
    -- speed move
    {
        "phaazon/hop.nvim",
        config = function()
            require("plugin-config.hop")
        end
    },
    -- sort
    {
        "sQVe/sort.nvim",
        config = function()
            require("plugin-config.sort")
        end,
    },
    -- auto session
    {
        "rmagatti/auto-session",
        config = function()
            require("plugin-config.auto-sess")
        end
    },
    -- comma text object
    -- use "austintaylor/vim-commaobject"
    -- vim thrift syntax
    -- "solarnz/thrift.vim", -- has been supported by treesitter
    -- stay in place format
    {
        "gbprod/stay-in-place.nvim",
        config = function()
            require("stay-in-place").setup {
                set_keymaps = true,
                preserve_visual_selection = true,
            }
        end,
    },
    -- tab scope buffers
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup {}
        end,
    },
    -- cursor line mode colors
    {
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
    },
    -- command result real time
    {
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
    },
    -- jsonpath
    "phelipetls/jsonpath.nvim",
    -- nvim-cmp for cmdline
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-buffer",
    "onsails/lspkind.nvim",
    { "tzachar/cmp-fuzzy-path", dependencies = { "hrsh7th/nvim-cmp", "tzachar/fuzzy.nvim" } },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugin-config.cmp")
        end
    },
    -- orgmode
    -- use {
    --     "nvim-orgmode/orgmode",
    --     config = function()
    --         require("orgmode").setup {}
    --         require("orgmode").setup_ts_grammar {}
    --     end,
    -- }
    -- toggle bool, words
    {
        "nguyenvukhang/nvim-toggler",
        config = function()
            require("plugin-config.toggler")
        end
    },
    -- real time line number
    {
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
    },
    {
        "anuvyklack/help-vsplit.nvim",
        config = function()
            require("help-vsplit").setup {
                always = false, -- Always open help in a vertical split.
                side = "right", -- 'left' or 'right'
                buftype = { "help" },
                filetype = { "man" }
            }
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_WindowLayout = 3
            vim.g.undotree_DiffAutoOpen = 1
            vim.g.undotree_SetFocusWhenToggle = 1
            -- vim.g.undotree_DiffCommand = "delta"
            vim.g.undotree_ShortIndicators = 1
        end,
    },
    -- better fold
    {
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("plugin-config.pretty-fold")
        end
    },
    {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
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
    },
    {
        "itchyny/calendar.vim",
        config = function()
            vim.g.calendar_google_calendar = 0
            vim.g.calendar_google_task = 0
        end
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "lewis6991/gitsigns.nvim" },
        config = function()
            require('scrollbar').setup {}
        end
    },
    "eandrju/cellular-automaton.nvim",
}, opts)
