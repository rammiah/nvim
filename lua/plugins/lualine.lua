return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        -- require("plugin-config.lualine")
        local lualine = require("lualine")
        local status_map = {
            ["NORMAL"] = "NORM",
            ["INSERT"] = "INS",
            ["SELECT"] = "SEL",
            ["COMMAND"] = "CMD",
            ["VISUAL"] = "VIS",
            ["V-LINE"] = "V-L",
            ["V-BLOCK"] = "V-B",
            ["REPLACE"] = "REPL",
            ["TERMINAL"] = "TERM",
        }

        -- helper functions

        -- format mode to short
        local function fmt_mode(str)
            local ret = status_map[str]
            if ret == nil then
                return str
            end
            return ret
        end

        -- format filepath for short
        local function shorten_filename(filepath)
            local words = vim.split(filepath, "/", { trimempty = true })
            if #words == 0 then
                return filepath
            end

            local arr = {}
            for i = 1, #words - 1, 1 do
                table.insert(arr, words[i]:sub(1, 1))
            end
            -- last component filename
            table.insert(arr, words[#words])

            local result = table.concat(arr, "/")
            if filepath:sub(1, 1) == '/' then
                result = "/" .. result
            end

            return result
        end

        -- nvim-tree extensions
        local function get_short_cwd()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ':~')
        end

        local nvim_tree = {
            sections = {
                lualine_a = { get_short_cwd },
                lualine_b = { "branch" },
            },
            filetypes = { "NvimTree" }
        }

        local telescope = {
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = fmt_mode
                    }
                },
                lualine_b = {
                    "branch"
                },
                lualine_c = {
                    function()
                        return " Telescope"
                    end
                },
            },
            filetypes = { "TelescopePrompt" }
        }


        -- local theme = "solarized_light"

        lualine.setup {
            options = {
                icons_enabled = true,
                -- theme = theme,
                -- theme = "solarized",
                theme = "auto",
                -- theme = "tokyonight",
                component_separators = { left = "", right = "" }, -- { left = "", right = "" }
                section_separators = { left = '', right = "" }, -- { left = "", right = ""},
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = true,
                ignore_focus = {},
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "mode",
                        fmt = fmt_mode
                    },
                },
                lualine_b = { "branch", "diff" },
                lualine_c = {
                    {
                        "filename",
                        file_status = true,
                        path = 1, -- 0: Just the filename
                        -- 1: Relative path
                        -- 2: Absolute path
                        -- 3: Absolute path, with tilde as the home directory

                        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
                        -- for other components. (terrible name, any suggestions?)
                        symbols = {
                            modified = "[+]", -- Text to show when the file is modified.
                            readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                            unnamed = "[New]", -- Text to show for unnamed buffers.
                        },
                        fmt = shorten_filename,
                    },
                    -- { gps.get_location, cond = gps.is_available },
                    "g:coc_status",
                },
                lualine_x = {
                    {
                        "filetype",
                        colored = true,     -- Displays filetype icon in color if set to true
                        icon_only = false,  -- Display only an icon for filetype
                        icon = { align = "right" }, -- Display filetype icon on the right hand side
                    },
                    "encoding",
                    {
                        "fileformat",
                        symbols = {
                            unix = "", -- e712
                            dos = "", -- e70f
                            mac = "", -- e711
                        }
                    },
                },
                lualine_y = {
                    {
                        "diagnostics",
                        sources = { "coc" },
                        sections = { "error", "warn" }, -- info hint
                        diagnostics_color = {
                            -- Same values as the general color option can be used here.
                            error = "DiagnosticError", -- Changes diagnostics' error color.
                            warn  = "DiagnosticWarn", -- Changes diagnostics' warn color.
                            info  = "DiagnosticInfo", -- Changes diagnostics' info color.
                            hint  = "DiagnosticHint", -- Changes diagnostics' hint color.
                        },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        colored = true,   -- Displays diagnostics status in color if set to true.
                        update_in_insert = false, -- Update diagnostics in insert mode.
                        always_visible = false, -- Show diagnostics even if there are none.
                    },
                },
                lualine_z = { "%l:%c", "%p%%/%L" },
            },
            inactive_sections = {
                -- lualine_z = { "%l:%c", "%p%%/%L" },
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = {
                    {
                        "filetype",
                        colored = true,     -- Displays filetype icon in color if set to true
                        icon_only = false,  -- Display only an icon for filetype
                        icon = { align = "right" }, -- Display filetype icon on the right hand side
                    }
                },
                lualine_y = {},
                -- lualine_z = {}
                lualine_z = { "%p%%/%L" },
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = { "toggleterm", nvim_tree, telescope },
        }

        vim.api.nvim_create_autocmd("User", {
            pattern = { "CocStatusChange", "CocDiagnosticChange" },
            desc = "refresh lualine for coc.nvim",
            callback = function(opts)
                lualine.refresh({
                    scope = "tabpage", -- scope of refresh all/tabpage/window
                    place = { "statusline" }, -- lualine segment ro refresh.
                })
            end,
        })
    end,
    lazy = true,
    event = "VeryLazy",
}
