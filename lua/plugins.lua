local util = require("packer.util")
local use = require("packer").use
return require("packer").startup({ function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    -- color theme
    use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
    use "overcache/NeoSolarized"
    use "NLKNguyen/papercolor-theme"
    use "mrtazz/molokai.vim"
    use "rakr/vim-one"
    -- nerd tree
    -- use { "preservim/nerdtree", requires = { "Xuyuanp/nerdtree-git-plugin" } }
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
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", requires = "p00f/nvim-ts-rainbow" }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    -- commenter
    use "preservim/nerdcommenter"
    -- bufferline (新增)
    use { "akinsho/bufferline.nvim", tag = "*", requires = { "kyazdani42/nvim-web-devicons" } }
    -- vim-go
    -- use "fatih/vim-go"
    use { "rammiah/nvim-go", requires = { "nvim-lua/plenary.nvim", "rcarriga/nvim-notify" } }
    use "rammiah/gocommand.vim"
    -- coc.nvim
    -- use { "rammiah/coc.nvim", branch = "master", run = "yarn install --frozen-lockfile" }
    use { "neoclide/coc.nvim", branch = "release" }
    use "fannheyward/telescope-coc.nvim"
    -- air-line
    -- use { "vim-airline/vim-airline", requires = { "vim-airline/vim-airline-themes" } }
    -- git
    -- use "tpope/vim-fugitive"
    -- lexima
    -- use { "cohama/lexima.vim" }
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
    -- use "bobrown101/git_blame.nvim"
    use 'dinhhuy258/git.nvim'
    -- git line signs, hunk previw and jump
    use "lewis6991/gitsigns.nvim"
    -- better filetype detect
    use "nathom/filetype.nvim"
    -- impatient to speed up vim
    use 'lewis6991/impatient.nvim'
    -- todo comment list
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
    use { "AckslD/nvim-neoclip.lua", requires = {
        "nvim-telescope/telescope.nvim",
        { 'tami5/sqlite.lua', module = 'sqlite' },
    },
    }
    -- float term
    use "voldikss/vim-floaterm"
    -- lualine status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use {
    --     "kwkarlwang/bufjump.nvim",
    --     config = function()
    --         require("bufjump").setup {
    --             forward = "<C-n>",
    --             backward = "<C-p>",
    --             on_success = nil
    --         }
    --     end,
    -- }

end,
config = {
    ensure_dependencies  = true, -- Should packer install plugin dependencies?
    snapshot             = nil, -- Name of the snapshot you would like to load at startup
    snapshot_path        = util.join_paths(vim.fn.stdpath('cache'), 'packer.nvim'), -- Default save directory for snapshots
    package_root         = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    compile_path         = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    plugin_package       = 'packer', -- The default package for plugins
    max_jobs             = 5, -- Limit the number of simultaneous jobs. nil means no limit
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
