require("git").setup({
    keymaps = {
        blame = "<Leader>gb", -- Open blame window
        quit_blame = "q", -- Close blame window
        blame_commit = "<CR>", -- Open blame commit
        browse = "<Leader>go", -- Open file/folder in git repository
        -- open_pull_request = "<Leader>gp", -- Open pull request of the current branch
        -- create_pull_request = "<Leader>gn", -- Create a pull request with the target branch is set in the `target_branch` option
        diff = "<Leader>gd", -- Opens a new diff that compares against the current index
        diff_close = "<Leader>gD", -- Close git diff
        -- revert = "<Leader>gr", -- Revert to the specific commit
        -- revert_file = "<Leader>gR", -- Revert the current file to the specific commit
    },
    -- Default target branch when create a pull request
    target_branch = "master",
})
