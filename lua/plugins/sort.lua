return {
    "sQVe/sort.nvim",
    config = function()
        local map = require("localutils").KeyMap

        require("sort").setup({
            -- Input configuration here.
            -- Refer to the configuration section below for options.
            -- List of delimiters, in descending order of priority, to automatically
            -- sort on.
            delimiters = {
                ",",
                "|",
                ";",
                ":",
                "s", -- Space
                "t", -- Tab
            }
        })

        map("n", 'gs"', [[vi"<Esc><Cmd>Sort<CR>]])
        map("n", "gs'", [[vi'<Esc><Cmd>Sort<CR>]])
        map("n", "gs(", "vi(<Esc><Cmd>Sort<CR>")
        map("n", "gs[", "vi[<Esc><Cmd>Sort<CR>")
        map("n", "gs{", "vi{<Esc><Cmd>Sort<CR>")
        map("n", "gs)", "vi)<Esc><Cmd>Sort<CR>")
        map("n", "gs]", "vi]<Esc><Cmd>Sort<CR>")
        map("n", "gs}", "vi}<Esc><Cmd>Sort<CR>")
        map("n", "gs[", "vi[<Esc><Cmd>Sort<CR>")
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
}
