local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    -- map_cr = true,
    disable_in_macro = false, -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    ignored_next_char = [=[[%w%%%'%[%"%.]]=],
    enable_moveright = true,
    enable_afterquote = true, -- add bracket pairs after quote
    enable_check_bracket_line = true, --- check bracket in same line
    enable_bracket_in_quote = true, --
    check_ts = false,
    ts_config = {
        lua = { 'string', 'source' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string', 'string' },
        java = false, -- don't check treesitter on java
    },
    map_cr = false,
    map_bs = true, -- map the <BS> key
    map_c_h = false, -- Map the <C-h> key to delete a pair
    map_c_w = false, -- map <c-w> to delete a pair if possible
})

local map = require('local-util').KeyMap

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.completion_confirm = function()
    if vim.fn.pumvisible() ~= 0 then
        return vim.fn["coc#_select_confirm"]()
    else
        return npairs.autopairs_cr()
    end
end

map('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true, silent = true })

local ts_conds = require('nvim-autopairs.ts-conds')

-- press % => %% only while inside a comment or string
npairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
    Rule("$", "$", "lua")
        :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})
