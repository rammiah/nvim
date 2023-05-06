local session = require("auto-session")

session.setup {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("state") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/" },
    auto_session_use_git_branch = true,
    -- the configs below are lua only
    bypass_session_save_file_types = { "NvimTree", "thrift", "diff" }
}

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>ss", function()
    session.SaveSession()
end, opts)

vim.keymap.set("n", "<leader>sr", function()
    session.RestoreSession()
end, opts)
