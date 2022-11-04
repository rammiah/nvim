local map = require("localutils").KeyMap

map('v', '<', '<gv')
map('v', '>', '>gv')
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
