return {
    "ojroques/nvim-osc52",
    config = function()
        local copy = function()
            if vim.v.event.operator == "y" and vim.v.event.regname == "" then
                require("osc52").copy_register("")
            end
        end
        vim.api.nvim_create_autocmd("TextYankPost", {
            desc = "copy text to ssh client using nvim-osc52",
            pattern = "*",
            callback = copy,
        })
        -- copy from current register, if this config is called by TextYankPost
        copy()
    end,
    cond = vim.g.neovide == nil,     -- 如果有neovide一定是本地环境，不需要osc52
    lazy = true,
    event = "TextYankPost",
}
