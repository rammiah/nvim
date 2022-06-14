-- local gps = require("nvim-gps")

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

local function fmt_mode(str)
    local ret = status_map[str]
    if ret == nil then
        return str
    end
    return ret
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "solarized_light",
        component_separators = { left = "", right = "" }, -- { left = "", right = "" }
        section_separators = { left = '', right = "" }, -- { left = "", right = ""},
        disabled_filetypes = { "NvimTree" },
        always_divide_middle = true,
        globalstatus = false,
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
                    unnamed = "[No Name]", -- Text to show for unnamed buffers.
                },
            },
            -- { gps.get_location, cond = gps.is_available },
            "g:coc_status",
        },
        lualine_x = {
            {
                "filetype",
                colored = true, -- Displays filetype icon in color if set to true
                icon_only = false, -- Display only an icon for filetype
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
                symbols = { error = "E", warn = "W", info = "I", hint = "H" },
                colored = true, -- Displays diagnostics status in color if set to true.
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
                colored = true, -- Displays filetype icon in color if set to true
                icon_only = false, -- Display only an icon for filetype
                icon = { align = "right" }, -- Display filetype icon on the right hand side
            }
        },
        lualine_y = {},
        -- lualine_z = {}
        lualine_z = { "%p%%/%L" },
    },
    tabline = {},
    extensions = {}
}
