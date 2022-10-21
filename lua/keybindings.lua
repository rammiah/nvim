local map = require("localutils").KeyMap

vim.g.mapleader = "\\"
map('v', '<', '<gv')
map('v', '>', '>gv')
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
