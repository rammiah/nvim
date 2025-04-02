return {
    {
        "onsails/lspkind.nvim",
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "tzachar/cmp-fuzzy-path",
        dependencies = {
            "tzachar/fuzzy.nvim"
        },
        lazy = true,
        event = "CmdlineEnter",
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require "cmp"
            local lspkind = require "lspkind"
            cmp.setup {
                formatting = {
                    format = lspkind.cmp_format({
                        preset = "codicons",
                        mode = "symbol",       -- show only symbol annotations
                        maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function(entry, vim_item)
                            return vim_item
                        end
                    })
                },
                sources    = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' }, -- For luasnip users.
                    { name = 'buffer' },
                    { name = 'nvim_lsp_signature_help' }
                }),
                completion = {
                    keyword_length = 2,
                    autocomplete = {
                        require('cmp.types').cmp.TriggerEvent.TextChanged,
                    },
                },
                mapping    = cmp.mapping.preset.insert({
                    -- confirm completion
                    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    -- scroll up and down the documentation window
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
            }
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local ts_utils = require("nvim-treesitter.ts_utils")

            local ts_node_func_parens_disabled = {
                -- ecma
                named_imports = true,
                -- rust
                use_declaration = true,
            }

            local default_handler = cmp_autopairs.filetypes["*"]["("].handler
            cmp_autopairs.filetypes["*"]["("].handler = function(char, item, bufnr, rules, commit_character)
                local node_type = ts_utils.get_node_at_cursor():type()
                if ts_node_func_parens_disabled[node_type] then
                    if item.data then
                        item.data.funcParensDisabled = true
                    else
                        char = ""
                    end
                end
                default_handler(char, item, bufnr, rules, commit_character)
            end

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done({
                    sh = false,
                })
            )
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
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require('lspconfig')['lua_ls'].setup {
                capabilities = capabilities
            }
            require('lspconfig')['gopls'].setup {
                capabilities = capabilities
            }
        end,
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-buffer",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "windwp/nvim-autopairs",
        },
        lazy = false,
    },
}
