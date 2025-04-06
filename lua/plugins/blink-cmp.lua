return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },

    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = 'default' },

        appearance = {
            nerd_font_variant = 'mono'
        },

        signature = { enabled = true },

        completion = {
            keyword = {
                range = 'prefix',
            },
            documentation = { auto_show = true },
            trigger = {
                show_on_keyword = true,
                show_on_trigger_character = true,
                show_on_insert_on_trigger_character = true,
                show_on_accept_on_trigger_character = true,
            }
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        snippets = { preset = 'default' },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
