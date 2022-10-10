-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- basic config
require("basic")
require("commands")
require("keybindings")
require("indent")

-- plugin init
require("plugins")
require("colorscheme")

-- plugins config
require("plugin-config.notify")
require("plugin-config.bufferline")
require("plugin-config.comment")
require("plugin-config.diffview")
require("plugin-config.filetype")
require("plugin-config.git")
require("plugin-config.gitsigns")
require("plugin-config.hop")
require("plugin-config.hydra")
require("plugin-config.lualine")
require("plugin-config.nvim-go")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-treesitter")
require("plugin-config.sort")
require("plugin-config.todo-comments")
require("plugin-config.toggleterm")
require("plugin-config.auto-sess")
