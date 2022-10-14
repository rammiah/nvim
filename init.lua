-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- basic config
_M = {} -- ad a global variable
require("basic")
require("filetype")
require("commands")
require("autocmd")
require("keybindings")
require("indent")

-- plugin init
require("plugins")
require("colorscheme")
