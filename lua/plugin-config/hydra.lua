if not require("local-util").safe_load("hydra") then
    return
end

local Hydra = require("hydra")

Hydra({
    name = "Windows",
    mode = { "n" },
    body = "<C-w>",
    config = {
        color = "pink",
    },
    heads = {
        -- move between windows
        { "<C-h>", "<Cmd>wincmd h<CR>" },
        { "<C-j>", "<Cmd>wincmd j<CR>" },
        { "<C-k>", "<Cmd>wincmd k<CR>" },
        { "<C-l>", "<Cmd>wincmd l<CR>" },

        -- resizing window
        -- { "H", "<C-w>3<" },
        -- { "L", "<C-w>3>" },
        -- { "K", "<C-w>1+" },
        -- { "J", "<C-w>1-" },

        -- move windows
        { "H", "<Cmd>wincmd H<CR>", { noremap = true, nowait = true, } },
        { "J", "<Cmd>wincmd J<CR>", { noremap = true, nowait = true, } },
        { "K", "<Cmd>wincmd K<CR>", { noremap = true, nowait = true, } },
        { "L", "<Cmd>wincmd L<CR>", { noremap = true, nowait = true, } },

        -- equalize window sizes
        -- { "e", "<C-w>=" },

        -- close active window
        -- { "Q", ":q<cr>" },
        { "<C-q>", ":q<cr>" },

        -- exit this Hydra
        { "q", nil, { exit = true, nowait = true } },
        -- { ";", nil, { exit = true, nowait = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
    },
})
