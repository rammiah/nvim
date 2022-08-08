if not require("local-util").safe_load("nvim-surround") then
    return
end

local M = require("nvim-surround.config")

require("nvim-surround").setup({
    keymaps = { -- vim-surround style keymaps
        -- insert = "<C-g>s",
        -- insert_line = "<C-g>S",
        delete = "ds",
        change = "cs",
        normal = "ys",
        normal_cur = "yss",
        normal_line = "yS",
        normal_cur_line = "ySS",
        visual = "S",
        visual_line = "gS",
    },
    surrounds = {
        ["("] = {
            add = { "( ", " )" },
            find = function()
                return M.get_selection({ textobject = "(" })
            end,
            delete = "^(. ?)().-( ?.)()$",
            change = {
                target = "^(. ?)().-( ?.)()$",
            },
        },
        [")"] = {
            add = { "(", ")" },
            find = function()
                return M.get_selection({ textobject = ")" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["{"] = {
            add = { "{ ", " }" },
            find = function()
                return M.get_selection({ textobject = "{" })
            end,
            delete = "^(. ?)().-( ?.)()$",
            change = {
                target = "^(. ?)().-( ?.)()$",
            },
        },
        ["}"] = {
            add = { "{", "}" },
            find = function()
                return M.get_selection({ textobject = "}" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["<"] = {
            add = { "< ", " >" },
            find = function()
                return M.get_selection({ textobject = "<" })
            end,
            delete = "^(. ?)().-( ?.)()$",
            change = {
                target = "^(. ?)().-( ?.)()$",
            },
        },
        [">"] = {
            add = { "<", ">" },
            find = function()
                return M.get_selection({ textobject = ">" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["["] = {
            add = { "[ ", " ]" },
            find = function()
                return M.get_selection({ textobject = "[" })
            end,
            delete = "^(. ?)().-( ?.)()$",
            change = {
                target = "^(. ?)().-( ?.)()$",
            },
        },
        ["]"] = {
            add = { "[", "]" },
            find = function()
                return M.get_selection({ textobject = "]" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["'"] = {
            add = { "'", "'" },
            find = function()
                return M.get_selection({ textobject = "'" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ['"'] = {
            add = { '"', '"' },
            find = function()
                return M.get_selection({ textobject = '"' })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["`"] = {
            add = { "`", "`" },
            find = function()
                return M.get_selection({ textobject = "`" })
            end,
            delete = "^(.)().-(.)()$",
            change = {
                target = "^(.)().-(.)()$",
            },
        },
        ["i"] = { -- TODO: Add find/delete/change functions
            add = function()
                local left_delimiter = M.get_input("Enter the left delimiter: ")
                local right_delimiter = left_delimiter and M.get_input("Enter the right delimiter: ")
                if right_delimiter then
                    return { { left_delimiter }, { right_delimiter } }
                end
            end,
            find = function() end,
            delete = function() end,
            change = { target = function() end },
        },
        ["t"] = {
            add = function()
                local input = M.get_input("Enter the HTML tag: ")
                if input then
                    local element = input:match("^<?([%w-]*)")
                    local attributes = input:match("%s+([^>]+)>?$")

                    local open = attributes and element .. " " .. attributes or element
                    local close = element

                    return { { "<" .. open .. ">" }, { "</" .. close .. ">" } }
                end
            end,
            find = function()
                return M.get_selection({ textobject = "t" })
            end,
            delete = "^(%b<>)().-(%b<>)()$",
            change = {
                target = "^<([%w-]*)().-([^/]*)()>$",
                replacement = function()
                    local element = M.get_input("Enter the HTML element: ")
                    if element then
                        return { { element }, { element } }
                    end
                end,
            },
        },
        ["T"] = {
            add = function()
                local input = M.get_input("Enter the HTML tag: ")
                if input then
                    local element = input:match("^<?([%w-]*)")
                    local attributes = input:match("%s+([^>]+)>?$")

                    local open = attributes and element .. " " .. attributes or element
                    local close = element

                    return { { "<" .. open .. ">" }, { "</" .. close .. ">" } }
                end
            end,
            find = function()
                return M.get_selection({ textobject = "t" })
            end,
            delete = "^(%b<>)().-(%b<>)()$",
            change = {
                target = "^<([^>]*)().-([^%/]*)()>$",
                replacement = function()
                    local input = M.get_input("Enter the HTML tag: ")
                    if input then
                        local element = input:match("^<?([%w-]*)")
                        local attributes = input:match("%s+([^>]+)>?$")

                        local open = attributes and element .. " " .. attributes or element
                        local close = element

                        return { { open }, { close } }
                    end
                end,
            },
        },
        ["f"] = {
            add = function()
                local result = M.get_input("Enter the function name: ")
                if result then
                    return { { result .. "(" }, { ")" } }
                end
            end,
            find = "[%w%-_:.>]+%b()",
            delete = "^([%w%-_:.>]+%()().-(%))()$",
            change = {
                target = "^.-([%w_]+)()%b()()()$",
                replacement = function()
                    local result = M.get_input("Enter the function name: ")
                    if result then
                        return { { result }, { "" } }
                    end
                end,
            },
        },
        invalid_key_behavior = {
            add = function(char)
                return { { char }, { char } }
            end,
            find = function(char)
                return M.get_selection({
                    pattern = vim.pesc(char) .. ".-" .. vim.pesc(char),
                })
            end,
            delete = function(char)
                return M.get_selections({
                    char = char,
                    pattern = "^(.)().-(.)()$",
                })
            end,
            change = {
                target = function(char)
                    return M.get_selections({
                        char = char,
                        pattern = "^(.)().-(.)()$",
                    })
                end,
            },
        },
        HTML = {
            ["t"] = "type",
            ["T"] = "whole",
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
    highlight = { -- Highlight text-objects before surrounding them
        duration = 0,
    },
    move_cursor = "begin",
})
