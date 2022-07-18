vim.bo.shiftwidth = 4
vim.bo.softtabstop = 4
vim.bo.expandtab = false

local save_load = require("local-util").safe_load

save_load("dap-go")
