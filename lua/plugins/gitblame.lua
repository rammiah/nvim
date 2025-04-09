return {
    "dinhhuy258/git.nvim",
    config = function()
        require("git").setup({
            default_mappings = false,
            keymaps = {
                custom_only = true,
                blame = "<leader>gb", -- Open blame window
                quit_blame = "q",  -- Close blame window
                blame_commit = "<CR>", -- Open blame commit
                browse = nil,      -- Open file/folder in git repository
                open_pull_request = nil, -- Open pull request of the current branch
                create_pull_request = nil, -- Create a pull request with the target branch is set in the `target_branch` option
                -- diff = "<leader>gd", -- "<leader>gd", -- Opens a new diff that compares against the current index
                -- diff_close = "q", -- Close git diff
                revert = nil, -- Revert to the specific commit
                revert_file = nil, -- Revert the current file to the specific commit
            },
            -- Default target branch when create a pull request
            target_branch = "master",
        })
    end,
    lazy = true,
    cmd = {
        "GitBlame",
    },
    keys = {
        "<leader>gb",
    },
}
