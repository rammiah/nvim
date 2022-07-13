if not require("local-util").safe_load("solarized") then
    return
end
-- Example config in lua
vim.g.solarized_italic_comments = true
vim.g.solarized_italic_keywords = false
vim.g.solarized_italic_functions = false
vim.g.solarized_italic_variables = false
vim.g.solarized_contrast = false
vim.g.solarized_borders = true
vim.g.solarized_disable_background = true

-- Load the colorscheme
-- require('solarized').set()
