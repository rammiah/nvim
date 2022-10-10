local map = require("localutils").KeyMap

require("auto-session").setup {
    log_level = "info",
    auto_session_enable_last_session = false,
    auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
    auto_session_enabled = true,
    auto_save_enabled = false,
    auto_restore_enabled = false,
    auto_session_suppress_dirs = { "~/" },
    auto_session_use_git_branch = true,
    -- the configs below are lua only
    bypass_session_save_file_types = { "NvimTree", "thrift", "diff" }
}

map("n", "<leader>ss", "<Cmd>SaveSession<CR>")
map("n", "<leader>sr", "<Cmd>RestoreSession<CR>")
