return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "hiphish/rainbow-delimiters.nvim",
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- "JoosepAlviste/nvim-ts-context-commentstring",
        "RRethy/nvim-treesitter-endwise",
    },
    lazy = true,
    event = "VeryLazy",
    -- commit = "da5825bf70cc2ea7eacd1e60c32c07baf19adeba",
    version = 'v0.10.0',
    config = function()
        vim.g.skip_ts_context_commentstring_module = true
        require("nvim-treesitter.configs").setup {
            -- 安装 language parser
            -- :TSInstallInfo 命令查看支持的语言
            ensure_installed = {
                -- "awk",
                "bash",
                -- "c",
                -- "c_sharp",
                -- "cmake",
                -- "cpp",
                -- "css",
                -- "csv",
                -- "cuda",
                -- "dart",
                -- "diff",
                -- "dockerfile",
                -- "erlang",
                -- "fish",
                -- "git_config",
                -- "gitattributes",
                -- "gitcommit",
                -- "gitignore",
                "go",
                -- "godot_resource",
                "gomod",
                "gosum",
                -- "gowork",
                -- "gpg",
                -- "haskell",
                -- "html",
                -- "http",
                -- "ini",
                -- "java",
                -- "javascript",
                -- "jq",
                -- "jsdoc",
                "json",
                "json5",
                "jsonc",
                -- "jsonnet",
                -- "julia",
                -- "kconfig",
                -- "kotlin",
                -- "llvm",
                -- "lua",
                -- "make",
                -- "markdown",
                -- "markdown_inline",
                -- "matlab",
                -- "ninja",
                -- "nix",
                -- "passwd",
                -- "pem",
                -- "perl",
                -- "php",
                -- "proto",
                -- "python",
                -- "ql",
                -- "qmljs",
                -- "regex",
                -- "ruby",
                -- "rust",
                -- "scala",
                -- "sql",
                -- "ssh_config",
                -- "swift",
                -- "thrift",
                -- "todotxt",
                -- "toml",
                -- "tsv",
                -- "tsx",
                -- "typescript",
                -- "vim",
                -- "vue",
                -- "xml",
                "yaml",
                -- "zig",
            },

            sync_install = true,
            -- 启用代码高亮功能
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            -- 启用增量选择
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>",
                    scope_incremental = "<TAB>",
                }
            },
            -- 启用基于Treesitter的代码格式化(=)
            -- 实际使用效果一般，还是用CocActionAsync("format")吧
            indent = {
                enable = true,
            },
            auto_tag = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                        ["al"] = "@loop.outer",
                        ["il"] = "@loop.inner",
                        ["cc"] = "@comment.outer",
                        ["ia"] = "@parameter.inner",
                        ["aa"] = "@parameter.outer",
                    },
                    include_surrounding_whitespace = false,
                    selection_modes = {
                        ["@parameter.outer"] = "v", -- charwise
                        ["@parameter.inner"] = "v", -- charwise
                        ["@function.outer"] = "V",  -- linewise
                        ["@function.inner"] = "V",  -- linewise
                        ["@class.outer"] = "<c-v>", -- blockwise
                        ["@loop.outer"] = "V",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        -- ["]m"] = "@function.outer",
                        ["]]"] = { query = "@function.outer", desc = "Next function start" },
                        -- ["]]"] = "@class.outer",
                    },
                    goto_next_end = {
                        -- ["]M"] = "@function.outer",
                        -- ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[["] = { query = "@function.outer", desc = "Previous function start" },
                        -- ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        -- ["[M"] = "@function.outer",
                        -- ["[]"] = "@class.outer",
                    },
                },
            },
            endwise = {
                enable = true,
            },
        }
        -- 开启 Folding
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
        -- 默认不要折叠
        -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
        vim.wo.foldlevel = 99
    end
}
