return {
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
                override_by_extension = {
                    ["log"] = {
                        icon = "",
                        color = "#81e043",
                        name = "Log"
                    },
                    ["crt"] = {
                        icon = "󱆈",
                        color = "#81e043",
                        name = "Cert"
                    },
                    ["key"] = {
                        icon = "",
                        color = "#81e043",
                        name = "Key"
                    },
                },
                color_icons = true,
                default = true,
            }
        end,
    }
