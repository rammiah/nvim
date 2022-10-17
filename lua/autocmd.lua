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
        if vim.fn.isdirectory(path) == 1 then
            return
        end
        vim.fn.mkdir(path, "p", "0o755")
    end,
    group = gid,
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

-- auto add shebang when create a file
vim.api.nvim_create_autocmd("BufNewFile", {
    desc = "add file shebang",
    pattern = "*",
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
    group = gid,
})

local ctags_args = {
    "--exclude=*/.git/*",
    "--exclude=*/.vim/*",
    "--exclude=*/kitex_gen/*",
    "--exclude=*/output/*",
    "--exclude=*/thrift_gen/*",
    "--exclude=.git/*",
    "--exclude=.vim/*",
    "--exclude=kitex_gen/*",
    "--exclude=output/*",
    "--exclude=thrift_gen/*",
    "--exclude=target/*",
    "--recurse",
    "-f", "tags",
}

local ctags_cmds = {
    c = { cmd = "ctags", args = ctags_args },
    cpp = { cmd = "ctags", args = ctags_args },
    go = { cmd = "ctags", args = ctags_args },
    java = { cmd = "ctags", args = ctags_args },
    json = { cmd = "ctags", args = ctags_args },
    lua = { cmd = "ctags", args = ctags_args },
    python = { cmd = "ctags", args = ctags_args },
}

-- auto generate ctags after write source file
vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "generate ctags file",
    pattern = "*",
    callback = function(opts)
        local ft = vim.filetype.match({
            buf = opts.buf,
        })
        if ft and ctags_cmds[ft] then
            local cmd = ctags_cmds[ft].cmd
            local args = ctags_cmds[ft].args
            if vim.fn.executable(cmd) ~= 1 then
                vim.notify(string.format("[ctags]please install %s to generate ctags file", cmd), levels.WARN)
                return
            end
            local job = Job:new({
                command = cmd,
                args = args,
                cwd = uv.cwd(),
                env = {
                    PATH = uv.os_getenv("PATH"),
                },
                on_exit = function(j, ret)
                    if ret ~= 0 then
                        vim.notify(string.format("[ctags]%s run not success, ret code %d", cmd, ret), levels.ERROR)
                    else
                        vim.notify(string.format("[ctags]%s run success", cmd), levels.INFO)
                    end
                end,
                on_stderr = function(err, data)
                    vim.notify(string.format("[ctags]%s run error %s, message:\n%s", cmd, err, data),
                        levels.ERROR)
                end,
            })
            job:start()
        end
    end,
    group = gid,
})
