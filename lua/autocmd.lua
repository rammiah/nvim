local uv = vim.loop

local id = vim.api.nvim_create_augroup("MyGroup", { clear = true })

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
    group = id,
})

local shells = {
    awk = "awk",
    bash = "bash",
    haskell = "runhaskell",
    julia = "julia",
    lua = "lua",
    make = "make",
    matlab = "octave", -- octave/matlab
    perl = "perl",
    php = "php",
    python = "python3",
    ruby = "ruby",
    scala = "scala",
    zsh = "zsh",
}

vim.api.nvim_create_autocmd("BufNewFile", {
    desc = "add file shebang",
    callback = function(opts)
        local bufnr = opts.buf
        print(string.format("filename %s", opts.file))
        local ft = vim.filetype.match({
            filename = opts.file,
        })
        print("filetype " .. vim.inspect(ft))
        if ft and shells[ft] then
            local lines = { "#!/usr/bin/env " .. shells[ft], "" }
            vim.api.nvim_put(lines, "l", false, true)
        end
    end,
    group = id,
})
