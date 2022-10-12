-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- basic config
require("basic")
require("commands")
require("keybindings")
require("indent")

-- plugin init
require("plugins")
require("colorscheme")
