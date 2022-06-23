require("git").setup({
    keymaps = {
        blame = "<leader>gb", -- Open blame window
        quit_blame = "q", -- Close blame window
        blame_commit = "<CR>", -- Open blame commit
        browse = false, -- Open file/folder in git repository
        open_pull_request = false, -- Open pull request of the current branch
        create_pull_request = false, -- Create a pull request with the target branch is set in the `target_branch` option
        diff = false, -- "<leader>gd", -- Opens a new diff that compares against the current index
        diff_close = "q", -- Close git diff
        revert = false, -- Revert to the specific commit
        revert_file = false, -- Revert the current file to the specific commit
    },
    -- Default target branch when create a pull request
    target_branch = "master",
})
