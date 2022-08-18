if not require("local-util").safe_load("nvim-surround") then
    return
end

local M = require("nvim-surround.config")

require("nvim-surround").setup({
    keymaps = { -- vim-surround style keymaps
        insert = "<C-g>s",
        insert_line = "<C-g>S",
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
                return M.get_selection({ motion = "a(" })
            end,
            delete = "^(. ?)().-( ?.)()$",
        },
        [")"] = {
            add = { "(", ")" },
            find = function()
                return M.get_selection({ motion = "a)" })
            end,
            delete = "^(.)().-(.)()$",
        },
        ["{"] = {
            add = { "{ ", " }" },
            find = function()
                return M.get_selection({ motion = "a{" })
            end,
            delete = "^(. ?)().-( ?.)()$",
        },
        ["}"] = {
            add = { "{", "}" },
            find = function()
                return M.get_selection({ motion = "a}" })
            end,
            delete = "^(.)().-(.)()$",
        },
        ["<"] = {
            add = { "< ", " >" },
            find = function()
                return M.get_selection({ motion = "a<" })
            end,
            delete = "^(. ?)().-( ?.)()$",
        },
        [">"] = {
            add = { "<", ">" },
            find = function()
                return M.get_selection({ motion = "a>" })
            end,
            delete = "^(.)().-(.)()$",
        },
        ["["] = {
            add = { "[ ", " ]" },
            find = function()
                return M.get_selection({ motion = "a[" })
            end,
            delete = "^(. ?)().-( ?.)()$",
        },
        ["]"] = {
            add = { "[", "]" },
            find = function()
                return M.get_selection({ motion = "a]" })
            end,
            delete = "^(.)().-(.)()$",
        },
        ["'"] = {
            add = { "'", "'" },
            find = function()
                return M.get_selection({ motion = "a'" })
            end,
            delete = "^(.)().-(.)()$",
        },
        ['"'] = {
            add = { '"', '"' },
            find = function()
                return M.get_selection({ motion = 'a"' })
            end,
            delete = "^(.)().-(.)()$",
        },
        ["`"] = {
            add = { "`", "`" },
            find = function()
                return M.get_selection({ motion = "a`" })
            end,
            delete = "^(.)().-(.)()$",
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
        },
        ["t"] = {
            add = function()
                local input = M.get_input("Enter the HTML tag: ")
                if input then
                    local element = input:match("^<?([^%s>]*)")
                    local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

                    local open = attributes and element .. " " .. attributes or element
                    local close = element

                    return { { "<" .. open .. ">" }, { "</" .. close .. ">" } }
                end
            end,
            find = function()
                return M.get_selection({ motion = "at" })
            end,
            delete = "^(%b<>)().-(%b<>)()$",
            change = {
                target = "^<([^%s<>]*)().-([^/]*)()>$",
                replacement = function()
                    local input = M.get_input("Enter the HTML tag: ")
                    if input then
                        local element = input:match("^<?([^%s>]*)")
                        local attributes = input:match("^<?[^%s>]*%s+(.-)>?$")

                        local open = attributes and element .. " " .. attributes or element
                        local close = element

                        return { { open }, { close } }
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
            find = function()
                local selection
                if vim.g.loaded_nvim_treesitter then
                    selection = M.get_selection({
                        query = {
                            capture = "@call.outer",
                            type = "textobjects",
                        },
                    })
                end
                if selection then
                    return selection
                end
                return M.get_selection({ pattern = "[^=%s%(%)]+%b()" })
            end,
            delete = function()
                local selections
                if vim.g.loaded_nvim_treesitter then
                    selections = M.get_selections({
                        char = "f",
                        exclude = function()
                            return M.get_selection({
                                query = {
                                    capture = "@call.inner",
                                    type = "textobjects",
                                },
                            })
                        end,
                    })
                    -- Adjust the selections since `@call.inner` includes parentheses
                    -- See https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/195
                    if selections then
                        selections.left.last_pos[2] = selections.left.last_pos[2] + 1
                        selections.right.first_pos[2] = selections.right.first_pos[2] - 1
                    end
                end
                if selections then
                    return selections
                end
                return M.get_selections({ char = "f", pattern = "^([^=%s%(%)]+%()().-(%))()$" })
            end,
            change = {
                target = "^.-([%w_]+)()%(.-%)()()$",
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
    highlight = { -- Highlight text-objects before surrounding them
        duration = 0,
    },
    move_cursor = "begin",
    indent_lines = function(start, stop)
        local b = vim.bo
        -- Only re-indent the selection if a formatter is set up already
        if start <= stop and (b.equalprg ~= "" or b.indentexpr ~= "" or b.cindent or b.smartindent or b.lisp) then
            vim.cmd(string.format("silent normal! %dG=%dG", start, stop))
        end
    end,
})
