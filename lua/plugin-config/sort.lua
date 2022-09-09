if not require("local-util").safe_load("sort") then
    return
end
local map = require("local-util").KeyMap

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
