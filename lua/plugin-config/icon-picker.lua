local map = require("local-util").KeyMap
require("icon-picker")

-- map("i", "<C-i>", "<cmd>PickIconsInsert<cr>")
map("n", "<leader><leader>i", "<cmd>PickIcons<cr>")
