if not require("localutils").safe_load("plenary.job") then
    return
end

local uv = vim.loop
local Job = require("plenary.job")
local levels = vim.log.levels

-- MyGroup group id
local gid = vim.api.nvim_create_augroup("MyGroup", { clear = true })

-- auto create dir before write file
vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "create dir if not exists",
    pattern = "*",
    callback = function()
        local path = vim.fn.expand("%:p:h")

        if path:sub(1, #"oil:/") == "oil:/" then
            return
        end

        if vim.fn.isdirectory(path) == 1 then
            return
        end

        if vim.fn.mkdir(path, "p", "0o755") == 0 then
            vim.notify(string.format("create folder %s failed", path), levels.ERROR)
            return
        else
            vim.notify(string.format("create folder %s success", path), levels.INFO)
        end
    end,
    group = gid,
})

local shells = {
    awk = "awk",
    bash = "bash",
    haskell = "runhaskell",
    julia = "julia",
    -- lua = "lua",
    make = "make",
    matlab = "octave", -- octave/matlab
    perl = "perl",
    php = "php",
    python = "python3",
    ruby = "ruby",
    scala = "scala",
    zsh = "zsh",
    sh = "bash",
}

-- auto add shebang when create a file
vim.api.nvim_create_autocmd("BufNewFile", {
    desc = "add shebang when create a new file",
    pattern = "*",
    callback = function(opts)
        local bufnr = opts.buf
        -- print("opts is "..vim.inspect(opts))
        local ft = vim.filetype.match({
            filename = opts.file,
            buf = opts.buf,
        })
        -- print("new ft is "..vim.inspect(ft))
        if ft and shells[ft] then
            local lines = { "#!/usr/bin/env " .. shells[ft], "", "" }
            vim.api.nvim_put(lines, "c", false, true)
        end
        local name = vim.fn.fnamemodify(opts.file, ":t")
        if name == ".envrc" then
            vim.api.nvim_put({ "source_up", "" }, "l", false, true)
        end
    end,
    group = gid,
})

-- add shebang for editing a empty file
vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "add shebang when read a empty file",
    pattern = "*",
    callback = function(opts)
        local stat = uv.fs_stat(vim.fn.expand("<afile>:p"))
        if stat == nil or stat.size > 0 then
            return
        end
        local ft = vim.filetype.match({
            filename = opts.file,
            buf = opts.buf,
        })
        -- print("read ft is "..vim.inspect(ft))
        if ft and shells[ft] then
            local lines = { "#!/usr/bin/env " .. shells[ft], "", "" }
            vim.api.nvim_put(lines, "c", true, true)
        end
    end,
    group = gid,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = gid,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank { higroup = 'IncSearch', timeout = 300 }
    end,
})
