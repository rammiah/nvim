if not require("local-util").safe_load("nvim-surround") then
    return
end

require("nvim-surround").setup({
    keymaps = { -- vim-surround style keymaps
        insert = "ys",
        visual = "S",
        delete = "ds",
        change = "cs",
    },
    delimiters = {
        pairs = {
            ["("] = { "( ", " )" },
            [")"] = { "(", ")" },
            ["{"] = { "{ ", " }" },
            ["}"] = { "{", "}" },
            ["<"] = { "< ", " >" },
            [">"] = { "<", ">" },
            ["["] = { "[ ", " ]" },
            ["]"] = { "[", "]" },
            [","] = { ",", "," },
            -- Define pairs based on function evaluations!
            ["i"] = function()
                return {
                    require("nvim-surround.utils").get_input(
                        "Enter the left delimiter: "
                    ),
                    require("nvim-surround.utils").get_input(
                        "Enter the right delimiter: "
                    )
                }
            end,
            ["f"] = function()
                return {
                    require("nvim-surround.utils").get_input(
                        "Enter the function name: "
                    ) .. "(",
                    ")"
                }
            end,
        },
        separators = {
            ["'"] = { "'", "'" },
            ['"'] = { '"', '"' },
            ["`"] = { "`", "`" },
        },
        HTML = {
            ["t"] = true, -- Use "t" for HTML-style mappings
        },
        aliases = {
            ["a"] = ">", -- Single character aliases apply everywhere
            ["b"] = ")",
            ["B"] = "}",
            ["r"] = "]",
            -- Table aliases only apply for changes/deletions
            ["q"] = { '"', "'", "`" }, -- Any quote character
            ["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
        },
    },
    highlight_motion = { -- Highlight text-objects before surrounding them
        duration = 0,
    }
})
