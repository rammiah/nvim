local map = require('local-util').KeyMap
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        -- diagnostics = "nvim_lsp"
    }
}

map("n", "<C-h>", ":BufferLineCyclePrev<CR>")
map("n", "<C-l>", ":BufferLineCycleNext<CR>")
map("n", "gb", ":BufferLinePick<CR>")
