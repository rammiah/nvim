local npairs = require("nvim-autopairs")

npairs.setup {
    disable_filetype = { "TelescopePrompt", "NvimTree" },
    disable_in_macro = false, -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    ignored_next_char = [=[[%w%%%'%[%"%.]]=],
    enable_moveright = true,
    enable_afterquote = true, -- add bracket pairs after quote
    enable_check_bracket_line = true, --- check bracket in same line
    enable_bracket_in_quote = true,
    check_ts = true,
    ts_config = {
        lua = { "string", "source" }, -- it will not add a pair on that treesitter node
        javascript = { "template_string", "string" },
    },
    map_cr = false,
    map_bs = true, -- map the <BS> key
    map_c_h = false, -- Map the <C-h> key to delete a pair
    map_c_w = false, -- map <c-w> to delete a pair if possible
}

vim.keymap.set("i", "<CR>", function()
    if vim.fn["coc#pum#visible"] and vim.fn["coc#pum#visible"]() ~= 0 then
        -- visible 返回int
        vim.fn["coc#pum#insert"]()
    elseif vim.fn["coc#expandable"] and vim.fn["coc#expandable"]() then
        -- expandable 返回bool
        vim.fn["coc#pum#insert"]()
    else
        local key = npairs.autopairs_cr()
        vim.api.nvim_feedkeys(key, "in", true)
    end
end, {
    noremap = true,
    silent = true,
})

local Rule = require 'nvim-autopairs.rule'
local cond = require 'nvim-autopairs.conds'

-- add pair space
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function(opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '{}', '[]' }, pair)
        end)
        :with_move(cond.none())
        :with_cr(cond.none())
        :with_del(function(opts)
            local col = vim.api.nvim_win_get_cursor(0)[2]
            local context = opts.line:sub(col - 1, col + 2)
            return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
        end),
    Rule('', ' )')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ')' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(')'),
    Rule('', ' }')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == '}' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key('}'),
    Rule('', ' ]')
        :with_pair(cond.none())
        :with_move(function(opts) return opts.char == ']' end)
        :with_cr(cond.none())
        :with_del(cond.none())
        :use_key(']'),
}

-- pass , ;
for _, punct in pairs { ",", ";" } do
    npairs.add_rules {
        Rule("", punct)
            :with_move(function(opts) return opts.char == punct end)
            :with_pair(function() return false end)
            :with_del(function() return false end)
            :with_cr(function() return false end)
            :use_key(punct)
    }
end
