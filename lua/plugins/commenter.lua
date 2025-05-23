return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup {
            ---Add a space b/w comment and the line
            ---@type boolean|fun():boolean
            padding = true,

            ---Whether the cursor should stay at its position
            ---NOTE: This only affects NORMAL mode mappings and doesn't work with dot-repeat
            ---@type boolean
            sticky = true,

            ---Lines to be ignored while comment/uncomment.
            ---Could be a regex string or a function that returns a regex string.
            ---Example: Use '^$' to ignore empty lines
            ---@type string|fun():string
            ignore = nil,

            ---LHS of toggle mappings in NORMAL + VISUAL mode
            ---@type table
            toggler = {
                ---Line-comment toggle keymap
                line = 'gcc',
                ---Block-comment toggle keymap
                block = 'gbc',
            },

            ---LHS of operator-pending mappings in NORMAL + VISUAL mode
            ---@type table
            opleader = {
                ---Line-comment keymap
                line = 'gc',
                ---Block-comment keymap
                block = 'gb',
            },

            ---LHS of extra mappings
            ---@type table
            extra = {
                ---Add comment on the line above
                above = 'gcO',
                ---Add comment on the line below
                below = 'gco',
                ---Add comment at the end of line
                eol = 'gcA',
            },

            ---Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
            ---NOTE: If `mappings = false` then the plugin won't create any mappings
            ---@type boolean|table
            mappings = {
                ---Operator-pending mapping
                ---Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
                ---NOTE: These mappings can be changed individually by `opleader` and `toggler` config
                basic = true,
                ---Extra mapping
                ---Includes `gco`, `gcO`, `gcA`
                extra = true,
            },

            ---Pre-hook, called before commenting the line
            ---@type fun(ctx: CommentCtx):string
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),

            ---Post-hook, called after commenting is done
            ---@type fun(ctx: CommentCtx)
            post_hook = nil,
        }
    end,
    lazy = true,
    keys = {
        "gbc",
        "gcc",
        "gcA",
        "gco",
        "gcO",
        {
            "gc", mode = "x",
        },
        {
            "gb", mode = "x",
        }
    },
}
