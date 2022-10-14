local map = require("localutils").KeyMap
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2


if require("localutils").safe_load("jsonpath") then
    -- jsonpath support
    if vim.fn.exists("+winbar") == 1 then
        vim.wo.winbar = "%{luaeval('require\"jsonpath\".get()')}"
    end
    -- send json path to clipboard
    map("n", "y<C-p>", [[:let @+=luaeval('require"jsonpath".get()')<CR>]])
end
