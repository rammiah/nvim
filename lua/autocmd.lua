local uv = vim.loop

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "create dir if not exists",
    pattern = "*",
    callback = function()
        local path = vim.fn.expand("%:p:h")
        if vim.fn.isdirectory(path) == 1 then
            return
        end
        vim.fn.mkdir(path, "p", "0o755")
    end,
})
