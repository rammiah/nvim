vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        -- diagnostics = "nvim_lsp"
    }
}

map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "gb", ":BufferLinePick<CR>", opt)

