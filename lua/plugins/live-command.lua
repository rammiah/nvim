return {
        "smjonas/live-command.nvim",
        config = function()
            require("live-command").setup {
                commands = {
                    Norm = { cmd = "norm" },
                    G = { cmd = "g" },
                },
                enable_highlighting = true,
                inline_highlighting = true,
                hl_groups = {
                    insertion = "DiffAdd",
                    deletion = "DiffDelete",
                    change = "DiffChange",
                },
                debug = false,
            }
        end
    }
