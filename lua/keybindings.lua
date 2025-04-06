local map = require("localutils").KeyMap

map('v', '<', '<gv')
map('v', '>', '>gv')
map("n", "]q", ":cnext<CR>")
map("n", "[q", ":cprevious<CR>")
map("n", "<C-s>", "<Cmd>noautocmd write<CR>")
-- map("n", "<C-6>", "<C-^>")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ss", function()
    local sess = require("auto-session")
    if sess ~= nil then
        sess.SaveSession()
    end
end, opts)

vim.keymap.set("n", "<leader>sr", function()
    local sess = require("auto-session")
    if sess ~= nil then
        sess.RestoreSession()
    end
end, opts)


if vim.g.neovide then
    vim.keymap.set("n", "<M-Enter>", function()
        vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen
    end, opts)
end

vim.keymap.set("n", "<leader>=", function()
    vim.lsp.buf.format()
end, opts)

-- delete vim.lsp keymap
vim.keymap.del("n", "gri")
vim.keymap.del("x", "gra")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "grn")
vim.keymap.del("i", "<C-s>")
