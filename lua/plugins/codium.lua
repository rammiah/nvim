return {
    -- "Exafunction/codeium.vim",
    "rammiah/codeium.vim",
    config = function()
        vim.g.codeium_idle_delay = 300
        vim.g.codeium_disable_bindings = 1
        vim.g.codeium_log_file = "/tmp/codeium.log"
        vim.g.codeium_log_level = "DEBUG"
        vim.keymap.set('i', '<Tab>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end,
    lazy = true,
    event = "BufEnter",
    version = "1.28.6",
    -- version = "1.12.0",
    enabled = true,
}
