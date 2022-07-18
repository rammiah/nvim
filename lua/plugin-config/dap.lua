local safe_load = require("local-util").safe_load
if not safe_load("dap") then
    return
end

local dap = require("dap")

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
dap.defaults.fallback.focus_terminal = true

-- local dap = require("dap")
local keymap = require("local-util").KeyMap

-- Debug
keymap("n", "<F5>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap("n", "<F6>", "<Cmd>lua require'dap'.continue()<CR>")
keymap("n", "<F7>", "<Cmd>lua require'dap'.step_over()<CR>")
keymap("n", "<F8>", "<Cmd>lua require'dap'.step_into()<CR>")
keymap("n", "<F9>", "<Cmd>lua require'dap'.step_out()<CR>")
keymap("n", "<F10>", "<Cmd>lua require'dap'.disconnect()<CR>")
keymap("i", "<F5>", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
keymap("i", "<F6>", "<Cmd>lua require'dap'.continue()<CR>")
keymap("i", "<F7>", "<Cmd>lua require'dap'.step_over()<CR>")
keymap("i", "<F8>", "<Cmd>lua require'dap'.step_into()<CR>")
keymap("i", "<F9>", "<Cmd>lua require'dap'.step_out()<CR>")
keymap("i", "<F10>", "<Cmd>lua require'dap'.disconnect()<CR>")


if safe_load("dap-go") then
    require("dap-go").setup()
end

if safe_load("dap-python") then
    local python_cmd = "~/.virtualenvs/debugpy/bin/python"
    if vim.fn.executable("~/.virtualenvs/debugpy/bin/python3") then
        python_cmd = python_cmd .. "3"
    end
    require('dap-python').setup(python_cmd)
end
