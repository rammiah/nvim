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
require("plugin-config.git")
require("plugin-config.gitsigns")
require("plugin-config.hop")
require("plugin-config.hydra")
require("plugin-config.nvim-go")
require("plugin-config.auto-sess")
