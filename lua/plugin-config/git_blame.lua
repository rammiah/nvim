-- require('git_blame').setup()

-- vim.cmd [[
-- command! GitBlame :lua require('git_blame').run()
-- ]]

vim.api.nvim_create_user_command('GitBlame', 'lua require("git_blame").run()', {

})
