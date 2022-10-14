vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = false

local Map = require("localutils").KeyMap
if require("localutils").safe_load("go") then
    Map("n", "<leader>tf", ":GoTestFunc<cr>", {
        silent = false,
    })
    Map("n", "<leader>tF", ":GoTestFile<cr>", {
        silent = false,
    })
end
