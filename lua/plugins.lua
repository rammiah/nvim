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
    "Mofiqul/dracula.nvim",
    "nvim-lua/plenary.nvim",
    -- use { "ellisonleao/gruvbox.nvim" }
    -- dev icons
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup {
                override = {
                    TelescopePrompt = {
                        icon = " ",
                        color = "#428850",
                        cterm_color = "65",
                        name = "Telescope"
                    },
                },
                color_icons = true,
                default = true,
            }
        end,
    },
    -- nvim tree
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icon
        },
        -- tag = "nightly" -- optional, updated every week. (see issue 1193)
        config = function()
            require("plugin-config.nvim-tree")
        end,
        lazy = true,
        cmd = {
            "NvimTreeOpen",
            "NvimTreeClose",
            "NvimTreeToggle",
            "NvimTreeFocus",
            "NvimTreeRefresh",
            "NvimTreeFindFile",
            "NvimTreeFindFileToggle",
            "NvimTreeClipboard",
            "NvimTreeResize",
            "NvimTreeCollapse",
            "NvimTreeCollapseKeepBuffers",
            "NvimTreeGenerateOnAttach",
        },
        keys = {
            "<leader>e"
        },
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
        lazy = true,
        event = "VeryLazy",
        -- commit = "635c450",
        config = function()
            require("plugin-config.nvim-treesitter")
        end,
    },
    {
        "nvim-treesitter/playground",
        lazy = true,
        cmds = {
            "TSPlaygroundToggle",
        },
    },
    -- commenter
    {
        "numToStr/Comment.nvim",
        config = function()
            require("plugin-config.comment")
        end,
        lazy = true,
        keys = {
            "gbc",
            "gcc",
            "gcA",
            "gco",
            "gcO",
            {
                "gc", mode = "x",
            },
            {
                "gb", mode = "x",
            }
        },
    },
    -- bufferline
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
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
        lazy = true,
        config = function()
            require("plugin-config.nvim-go")
        end,
        ft = {
            "go",
            "gomod",
        },
    },
    "rammiah/gocommand.vim",
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugin-config.notify")
        end,
        lazy = true,
        event = "VeryLazy",
    },
    -- coc.nvim
    {
        "neoclide/coc.nvim",
        branch = "release",
        config = function()
            require("plugin-config.coc")
        end,
        event = "VeryLazy",
        lazy = true,
    },
    -- auto pair
    {
        "windwp/nvim-autopairs",
        config = function()
            require("plugin-config.autopairs")
        end,
        lazy = true,
        event = "VeryLazy",
    },
    {
        "windwp/nvim-ts-autotag",
        config = function()
            require("plugin-config.autotag")
        end,
        lazy = true,
        event = "VeryLazy",
    },
    -- surround
    {
        "kylechui/nvim-surround",
        version = "*",
        config = function()
            require("plugin-config.surround")
        end,
        lazy = true,
        keys = {
            "ds",
            "cs",
            "ys",
            "yss",
            "yS",
            "ySS",
            {
                "S", mode = "x",
            },
            {
                "gS", mode = "x",
            }
        },
    },
    {
        "ojroques/nvim-osc52",
        config = function()
            local copy = function()
                if vim.v.event.operator == 'y' and vim.v.event.regname == '' then
                    require('osc52').copy_register('')
                end
            end
            vim.api.nvim_create_autocmd("TextYankPost", {
                desc = "copy text to ssh client using nvim-osc52",
                pattern = "*",
                callback = copy,
            })
            -- copy from current register, if this config is called by TextYankPost
            copy()
        end,
        lazy = true,
        event = "TextYankPost",
    },
    -- suda sudo write
    {
        "lambdalisue/suda.vim",
        config = function()
            vim.g.suda_smart_edit = 0
            vim.g["suda#prompt"] = "password: "
        end,
        lazy = true,
        cmd = {
            "SudaWrite",
            "SudaRead",
        },
    },
    -- telescope and plugins
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                lazy = true,
            },
            {
                -- fzf support
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                lazy = true,
            },
            {
                "nvim-lua/popup.nvim",
                lazy = true,
            },
            {
                "nvim-telescope/telescope-hop.nvim",
                lazy = true,
            },
        },
        config = function()
            require("plugin-config.telescope-conf")
        end,
        lazy = true,
        cmd = {
            "Telescope",
            "TodoTelescope",
        },
        keys = {
            "<leader>ff", "<leader>fg",
            "<leader>fb", "<leader>fr",
            "<leader>fs", "<leader>fl",
        },
    },
    -- neovim start time
    {
        "dstein64/vim-startuptime",
        lazy = true,
        cmd = {
            "StartupTime",
        },
    },
    -- git diff view
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("plugin-config.diffview")
        end,
        lazy = true,
        cmd = {
            "DiffviewOpen",
            "DiffviewFileHistory",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh",
            "DiffviewLog",
        },
    },
    -- git blame
    {
        "dinhhuy258/git.nvim",
        config = function()
            require("plugin-config.git")
        end,
        lazy = true,
        cmd = {
            "GitBlame",
        },
        keys = {
            "<leader>gb",
        },
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
        lazy = true,
        keys = {
            "<C-\\>",
            "<leader>tl",
            "<leader>tt",
            "<leader>tu",
            "<leader>tp",
            "<leader>tn",
            "<leader>`",
        },
        cmd = {
            "ToggleTerm",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualLines",
            "ToggleTermSendVisualSelection",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
        },
    },
    -- lualine status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugin-config.lualine")
        end,
        lazy = true,
        event = "VeryLazy",
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
        end,
        lazy = true,
        event = { "WinScrolled", "TextChanged", "TextChangedI" },
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
        end,
        lazy = true,
        keys = {
            "<C-h>",
        },
    },
    -- sort
    {
        "sQVe/sort.nvim",
        config = function()
            require("plugin-config.sort")
        end,
        lazy = true,
        keys = {
            "gs'",
            "gs(",
            "gs)",
            "gs[",
            "gs[",
            "gs]",
            "gs{",
            "gs}",
            'gs"',
        },
        cmd = {
            "Sort",
        },
    },
    -- auto session
    {
        "rmagatti/auto-session",
        config = function()
            require("plugin-config.auto-sess")
        end,
        lazy = true,
        keys = {
            "<leader>ss",
            "<leader>sr",
        },
        cmd = {
            "AutoSession",
            "DelteteSession",
            "RestoreSession",
            "RestoreSessionFromFile",
            "SaveSession",
        },
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
        lazy = true,
        event = "VeryLazy",
    },
    -- tab scope buffers
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup {}
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
    {
        "phelipetls/jsonpath.nvim",
        lazy = true,
        ft = {
            "json",
            "jsonc",
            "jsonc5",
        },
    },
    -- nvim-cmp for cmdline
    {
        "onsails/lspkind.nvim",
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "tzachar/cmp-fuzzy-path",
        dependencies = {
            "tzachar/fuzzy.nvim"
        },
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugin-config.cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
        },
        lazy = true,
        event = { "CmdlineEnter" },
    },
    -- toggle bool, words
    {
        "nguyenvukhang/nvim-toggler",
        config = function()
            require("plugin-config.toggler")
        end,
        lazy = true,
        keys = "<leader>cl",
    },
    -- real time line number
    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup {
                show_numbers = true,         -- Enable 'number' for the window while peeking
                show_cursorline = true,      -- Enable 'cursorline' for the window while peeking
                hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
                number_only = false,         -- Peek only when the command is only a number instead of when it starts with a number
                centered_peeking = true,     -- Peeked line will be centered relative to window
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
        lazy = true,
        event = "VeryLazy",
        cmd = {
            "Man",
        },
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
        lazy = true,
        cmd = {
            "UndoTreeToggle",
            "UndoTreeShow",
            "UndoTreeHide",
            "UndoTreeFocus",
        },
    },
    {
        "itchyny/calendar.vim",
        config = function()
            vim.g.calendar_google_calendar = 0
            vim.g.calendar_google_task = 0
        end,
        lazy = true,
        cmd = {
            "Calendar",
        },
    },
    {
        "petertriho/nvim-scrollbar",
        dependencies = { "lewis6991/gitsigns.nvim" },
        config = function()
            require('scrollbar').setup {}
        end,
        lazy = true,
        event = "VeryLazy",
    },
    {
        "eandrju/cellular-automaton.nvim",
        lazy = true,
        cmd = {
            "CellularAutomaton",
        },
    },
    {
        "github/copilot.vim",
        config = function()
            vim.g.copilot_filetypes = {
                ["TelescopePrompt"] = false,
            }
        end,
    },
}, opts)
