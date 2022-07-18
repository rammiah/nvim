if not require("local-util").safe_load("hydra") then
    return
end

local Hydra = require("hydra")

Hydra({
    name = "Windows",
    mode = { "n" },
    body = "<leader>w",
    config = {
        invoke_on_body = true,
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

        -- bufferline
        { "h", function() vim.cmd("BufferLineCyclePrev") end, { on_key = false } },
        { "l", function() vim.cmd("BufferLineCycleNext") end, { on_key = false } },

        -- { "H", function() vim.cmd("BufferLineCloseLeft") end, { desc = false } },
        -- { "L", function() vim.cmd("BufferLineCloseRight") end, { desc = false } },

        { "P", function() vim.cmd("BufferLinePickClose") end, { desc = "pick close" } },

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
