local map = require("local-util").KeyMap

vim.g.mapleader = "\\"
-- vim.g.maplocalleader = ";"
-- 保存本地变量
-- 持续缩进
map('v', '<', '<gv')
map('v', '>', '>gv')
-- 分屏切换
-- map("n", "<M-h>", "<C-w>h")
-- map("n", "<M-j>", "<C-w>j")
-- map("n", "<M-k>", "<C-w>k")
-- map("n", "<M-l>", "<C-w>l")
-- nerdtree
-- map('n', '<C-n>', ':NERDTreeToggle<CR>')
-- map('n', '<C-f>', ':NERDTreeFind<CR>')
-- bufferline 左右Tab切换
map("n", "]t", ":tabnext<CR>")
map("n", "[t", ":tabprevious<CR>")
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
-- ctrl-l clear highlight
-- map("n", "<C-l>", "<Cmd>nohlsearch<CR><C-l>")
map("n", "c,", "ct,")
map("n", "d,", "dt,")

-- tag
-- map("n", "<leader>tag", ":!ctags -R<CR>", { noremap = true })
-- Files

-- map("v", "<leader>y", ":OSCYank<CR>")

-- githunk jump
-- map("n", ']h', '<Plug>(GitGutterNextHunk)')
-- map('n', '[h', '<Plug>(GitGutterPrevHunk)')

local pluginKeys = {}

return pluginKeys
