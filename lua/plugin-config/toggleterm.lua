if not require("local-util").safe_load("toggleterm") then
    return
end

require("toggleterm").setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    -- on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
    -- on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
    -- on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    highlights = {
        -- highlights which map to a highlight group name and a table of it's values
        -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
        -- Normal = {
        --     guibg = "<VALUE-HERE>",
        -- },
        -- NormalFloat = {
        --     link = 'Normal'
        -- },
        -- FloatBorder = {
        --     guifg = "<VALUE-HERE>",
        --     guibg = "<VALUE-HERE>",
        -- },
    },
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = 3, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        border = "curved",
        winblend = 0,
        -- highlights = {
        --     border = "Normal",
        --     background = "Normal",
        -- },
    },
}

local Terminal = require('toggleterm.terminal').Terminal
local map = require("local-util").KeyMap

local M = {}

local function add_terminal(exe, args, key)
    local args = args or {}
    if vim.fn.executable(exe) then
        local term = Terminal:new({
            cmd = exe .. table.concat(args, " "),
            hidden = true,
            direction = "float",
            count = 100,
            on_open = function(t)
                vim.api.nvim_buf_set_keymap(t.bufnr, "t", "<C-\\>",
                    "<Cmd>lua require('plugin-config.toggleterm')." .. exe .. "Toggle()<CR>",
                    { silent = true, noremap = true })
            end,
            highlight = {
                NormalFloat = { link = "PMenu" },
            },
        })

        M[exe .. "Toggle"] = function()
            term:toggle()
        end

        map("n", key, "<Cmd>lua require('plugin-config.toggleterm')." .. exe .. "Toggle()<CR>")
    else
        vim.notify("please install " .. exe .. " first!!!", vim.log.levels.WARN)
    end
end

add_terminal("lazygit", nil, "<leader>tl")
add_terminal("htop", nil, "<leader>tt")
add_terminal("ncdu", nil, "<leader>tu")
add_terminal("ipython", nil, "<leader>tp")
add_terminal("node", nil, "<leader>tn")

return M
