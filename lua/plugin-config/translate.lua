if not require("local-util").safe_load("pantran") then
    return
end

local map = require("local-util").KeyMap
map("n", "<leader>tr", "<Cmd>lua require('pantran').motion_translate()<CR>")
-- map("n", "<leader>trr", "<Cmd>lua require('pantran').motion_translate()_<CR>")
map("x", "<leader>tr", "<Cmd>lua require('pantran').motion_translate()<CR>")

-- local pantran = require("pantran")

-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
-- vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
-- vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)

require("pantran").setup {
    engines = {
        -- Configuration for individual engines goes here. To list available
        -- engine names run `:lua =vim.tbl_keys(require("pantran.engines"))`.
        default_engine = "google",
        yandex = {
            -- Default languages can be defined on a per engine basis. In this case
            -- `:lua require("pantran.async").run(function()
            -- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
            -- can be used to list available language identifiers.
            default_source = "auto",
            default_target = "zh-CN",
        },
    },
    controls = {
        mappings = {
            edit = {
                n = {
                    -- Use this table to add additional mappings for the normal mode in
                    -- the translation window. Either strings or function references are
                    -- supported.
                    ["j"] = "gj",
                    ["k"] = "gk",
                },
                i = {
                    -- Similar table but for insert mode. Using 'false' disables
                    -- existing keybindings.
                    ["<C-y>"] = false,
                    ["<C-a>"] = require("pantran.ui.actions").yank_close_translation,
                }
            },
            select = {
                n = {
                    -- Keybindings here are used in the selection window.
                }
            }
        }
    }
}

