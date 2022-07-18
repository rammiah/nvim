vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

local safe_load = require("local-util").safe_load

if safe_load("dap-python") then
    local python_cmd = "~/.virtualenvs/debugpy/bin/python"
    if vim.fn.executable("~/.virtualenvs/debugpy/bin/python3") then
        python_cmd = python_cmd .. "3"
    end
    require('dap-python').setup(python_cmd)
end
