return {
    "nguyenvukhang/nvim-toggler",
    config = function()
        local toggler = require("nvim-toggler")
        toggler.setup {
            inverses = {
                ["true"] = "false",
                ["yes"] = "no",
                ["on"] = "off",
                ["left"] = "right",
                ["up"] = "down",
                ["!="] = "==",
                ["connected"] = "disconnected",
                ["vim"] = "emacs",
                ["True"] = "False",
                ["TRUE"] = "FALSE",
                ["Yes"] = "No",
                ["YES"] = "NO",
                ["success"] = "fail",
                [">"] = "<",
                ["&&"] = "||",
                ["++"] = "--",
                ["This"] = "That",
                ["Those"] = "These",
                ["this"] = "that",
                ["those"] = "these",
            },
            remove_default_keybinds = true,
            remove_default_inverses = true,
        }

        vim.keymap.set({ "n", "v" }, "<leader>cl", toggler.toggle, {
            noremap = true,
            silent = true,
            unique = true,
        })
    end,
    lazy = true,
    keys = "<leader>cl",
}
