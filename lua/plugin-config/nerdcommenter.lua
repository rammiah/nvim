local api = vim.api

-- space after comment delimiter
api.nvim_set_var("NERDSpaceDelims", 1)
api.nvim_set_var("NERDDefaultAlign", "left")
-- commenter
map("n", "<C-_>", ":call nerdcommenter#Comment('n', 'toggle')<CR>", opt)
map("v", "<C-_>", ":call nerdcommenter#Comment('x', 'toggle')<CR>gv", opt)
