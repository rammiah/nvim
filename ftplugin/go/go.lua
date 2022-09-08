vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = false

local Map = require("local-util").KeyMap
if require("local-util").safe_load("go") then
    Map("n", "<leader>tf", ":GoTestFunc<cr>", {
        silent = false,
    })
    Map("n", "<leader>tF", ":GoTestFile<cr>", {
        silent = false,
    })
end
