return {
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
    }
