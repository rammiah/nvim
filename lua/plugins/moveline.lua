return {
    "willothy/moveline.nvim",
    build = "make",
    config = function()
        local moveline = require("moveline")
        vim.keymap.set("n", "<M-k>", moveline.up)
        vim.keymap.set("n", "<M-j>", moveline.down)
        vim.keymap.set("v", "<M-k>", moveline.block_up)
        vim.keymap.set("v", "<M-j>", moveline.block_down)
    end,
    lazy = true,
    keys = {
        { "<M-k>", mode = "n", desc = "(normal)move line up" },
        { "<M-j>", mode = "n", desc = "(nornal)move line down" },
        { "<M-k>", mode = "x", desc = "(visual)move block up" },
        { "<M-j>", mode = "x", desc = "(visual)move block down" },
    },
}
