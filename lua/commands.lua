local uv = vim.loop
local Job = require("plenary.job")
local levels = vim.log.levels

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
    "--exclude=vendor/*",
    "--exclude=node_modules/*",
    "--exclude=build/*",
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
    [""] = { cmd = "ctags", args = ctags_args },
}

-- auto generate ctags after write source file
vim.api.nvim_create_user_command("Ctags", function(opts)
    local ft = vim.filetype.match({
        buf = vim.api.nvim_get_current_buf(),
    }) or ""

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
                PATH = vim.fn.getenv("PATH"),
            },
            on_exit = function(j, ret)
                if ret ~= 0 then
                    vim.notify(string.format("[ctags]%s run not success, ret code %d", cmd, ret), levels.ERROR)
                else
                    vim.notify(string.format("[ctags]%s run success", cmd), levels.INFO)
                end
            end,
            on_stderr = function(_, data)
                vim.notify(string.format("[ctags]%s run error, message:\n%s", cmd, data),
                    levels.ERROR)
            end,
        })
        job:start()
    end
end, {
    desc = "generate ctags file",
    force = true,
    bang = false,
})
