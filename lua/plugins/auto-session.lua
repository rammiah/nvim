return {
    "rmagatti/auto-session",
    config = function()
        -- require("plugin-config.auto-sess")
        local session = require("auto-session")

        session.setup {
            log_level = "error",
            auto_session_enable_last_session = false,
            auto_session_root_dir = vim.fn.stdpath("state") .. "/sessions/",
            auto_session_enabled = true,
            auto_save_enabled = false,
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/" },
            auto_session_use_git_branch = true,
            -- the configs below are lua only
            bypass_session_save_file_types = { "NvimTree", "thrift", "diff", "vimdoc", "help" },
            post_save_cmds = {
                function()
                    vim.notify("Session save success!", vim.log.levels.INFO)
                end,
            },
            post_restore_cmds = {
                function()
                    vim.notify("Session restore success!", vim.log.levels.INFO)
                end,
            },
        }
    end,
    lazy = true,
    cmd = {
        "AutoSession",
        "DelteteSession",
        "RestoreSession",
        "RestoreSessionFromFile",
        "SaveSession",
    },
}
