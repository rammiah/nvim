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

        -- split window
        { "<C-s>", "<Cmd>split<CR>" },
        { "<C-v>", "<Cmd>vsplit<CR>" },

        -- move windows
        { "H", "<Cmd>wincmd H<CR>", { noremap = true, nowait = true } },
        { "J", "<Cmd>wincmd J<CR>", { noremap = true, nowait = true } },
        { "K", "<Cmd>wincmd K<CR>", { noremap = true, nowait = true } },
        { "L", "<Cmd>wincmd L<CR>", { noremap = true, nowait = true } },

        -- only
        { "<C-o>", "<Cmd>only<CR>", { exit = true, desc = false } },

        -- equalize window sizes
        { "<C-e>", "<C-w>=" },

        -- close active window
        -- { "Q", ":q<cr>" },
        { "<C-q>", "<Cmd>wincmd q<CR>" },

        -- exit this Hydra
        { "q", nil, { exit = true, nowait = true } },
        -- { ";", nil, { exit = true, nowait = true } },
        { "<Esc>", nil, { exit = true, nowait = true } },
    },
})
