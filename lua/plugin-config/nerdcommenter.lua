local map = require('local-util').KeyMap

-- space after comment delimiter
vim.g.NERDSpaceDelims =  1
vim.g.NERDDefaultAlign = "left"
vim.g.NERDCreateDefaultMappings= 0
-- commenter
map("n", "<C-_>", ":call nerdcommenter#Comment('n', 'toggle')<CR>")
map("v", "<C-_>", ":call nerdcommenter#Comment('x', 'toggle')<CR>gv")
