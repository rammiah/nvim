local map = require("local-util").KeyMap

vim.cmd [[
autocmd BufEnter * :lua require("lazygit.utils").project_root_dir()
]]

vim.g.lazygit_floating_window_winblend = 1 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_corner_chars = {"╭", "╮", "╰", "╯"} -- customize lazygit popup window corner characters
vim.g.lazygit_floating_window_use_plenary = 1 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

map("n", "<leader>lz", ":LazyGit<CR>")
