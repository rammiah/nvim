local cmp = require "cmp"
local lspkind = require "lspkind"
cmp.setup {
    formatting = {
        format = lspkind.cmp_format({
            preset = "codicons",
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                return vim_item
            end
        })
    },
}
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    -- fields = { "kind", "abbr" },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "buffer", keyword_length = 2 }
    }),
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
    -- fields = { "kind", "abbr" },
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources(
        {
            { name = "cmdline", keyword_length = 2 }
        },
        {
            { name = "path", keyword_length = 2 }
        },
        {
            { name = "fuzzy_path", keyword_length = 2, option = { fd_timeout_msec = 2000 } },
        }
    ),
})
