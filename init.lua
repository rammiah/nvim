-- https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=VC%20CODE
-- ██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗
-- ██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
-- ██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗  
-- ╚██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝  
--  ╚████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗
--   ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
-- basic config
require("basic")
require("filetype")
require("commands")
require("autocmd")
require("keybindings")
require("indent")

-- plugin init
require("plugins")
require("colorscheme")
