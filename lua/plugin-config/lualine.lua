local function fmt_mode(str)

    local status_map = {
    }
    status_map["NORMAL"] = "NORM"
    status_map["INSERT"] = "INS"
    status_map["SELECT"] = "SEL"
    status_map["COMMAND"] = "CMD"
    status_map["VISUAL"] = "VIS"
    status_map["V-LINE"] = "V-L"
    status_map["V-BLOCK"] = "V-B"
    status_map["REPLACE"] = "REPL"
    local ret = status_map[str]
    if ret == nil then
        return str
    end
    return ret
end

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            {
                'mode',
                fmt = fmt_mode
            },
        },
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
            {
                'filename',
                file_status = true,
                path = 1,
                shorting_target = 30,
            },
            'g:coc_status',
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
            'location',
            {
                "diagnostics",
                sources = { "coc" },
                sections = { 'error', 'warn' }, -- info hint
                diagnostics_color = {
                    -- Same values as the general color option can be used here.
                    error = 'DiagnosticError', -- Changes diagnostics' error color.
                    warn  = 'DiagnosticWarn', -- Changes diagnostics' warn color.
                    info  = 'DiagnosticInfo', -- Changes diagnostics' info color.
                    hint  = 'DiagnosticHint', -- Changes diagnostics' hint color.
                },
                symbols = { error = 'E', warn = 'W', info = 'I', hint = 'H' },
                colored = true, -- Displays diagnostics status in color if set to true.
                update_in_insert = false, -- Update diagnostics in insert mode.
                always_visible = false, -- Show diagnostics even if there are none.
            }
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
