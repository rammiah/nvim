require('nvim-treesitter.configs').setup {
    -- 安装 language parser
    -- :TSInstallInfo 命令查看支持的语言
    ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "cmake",
        "cpp",
        "css",
        "erlang",
        "fortran",
        "go",
        "gomod",
        "gowork",
        "graphql",
        "haskell",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "julia",
        "kotlin",
        "latex",
        "llvm",
        "lua",
        "make",
        "markdown",
        "ninja",
        "nix",
        "ocaml",
        "perl",
        "php",
        "python",
        "ruby",
        "rust",
        "scala",
        "swift",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vue",
        "yaml",
    },

    sync_install = false,
    -- 启用代码高亮功能
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- 启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>',
        }
    },
    -- 启用基于Treesitter的代码格式化(=)
    -- 实际使用效果一般，还是用CocActionAsync('format')吧
    indent = {
        enable = false,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 5000, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    auto_tag = {
        enable = true,
    }
}
-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
