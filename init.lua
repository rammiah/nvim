-- https://patorjk.com/software/taag/#p=display&v=0&f=ANSI%20Shadow&t=VC%20CODE
-- ██╗   ██╗███████╗     ██████╗ ██████╗ ██████╗ ███████╗
-- ██║   ██║██╔════╝    ██╔════╝██╔═══██╗██╔══██╗██╔════╝
-- ██║   ██║███████╗    ██║     ██║   ██║██║  ██║█████╗
-- ╚██╗ ██╔╝╚════██║    ██║     ██║   ██║██║  ██║██╔══╝
--  ╚████╔╝ ███████║    ╚██████╗╚██████╔╝██████╔╝███████╗
--   ╚═══╝  ╚══════╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝

require("basic")
require("filetype")

-- plugin init
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://gh.i2x.cc/github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("plugins")
require("commands")
require("autocmd")
require("keybindings")
require("indent")

require("colorscheme")
