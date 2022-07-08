-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- basic config
require("basic")
require("keybindings")
require("indent")

-- plugin init
require("plugins")
require("colorscheme")
require("plugin-config.impatient")

-- plugins config
require("plugin-config.diffview")
require("plugin-config.comment")
require("plugin-config.nvim-go")
require("plugin-config.suda")
require("plugin-config.telescope-conf")
require("plugin-config.autopairs")
require("plugin-config.autotag")
require("plugin-config.bufferline")
require("plugin-config.filetype")
require("plugin-config.gitsigns")
require("plugin-config.lazygit")
require("plugin-config.nvim-tree")
require("plugin-config.nvim-treesitter")
require("plugin-config.todo-comments")
require("plugin-config.neoclip")
require("plugin-config.git")
-- require("plugin-config.nvim-gps-conf")
require("plugin-config.dressing")
require("plugin-config.icon-picker")
require("plugin-config.yank")
require("plugin-config.lualine")
require("plugin-config.coc")
require("plugin-config.spellcheck")
require("plugin-config.toggleterm")
require("plugin-config.glow")
require("plugin-config.colorizer")
-- require("plugin-config.monokai")
require("plugin-config.lastplace")
require("plugin-config.hydra")
require("plugin-config.hop")
require("plugin-config.notify")
require("plugin-config.surround")
