-- add a global variable
_M = {}
-- set mapleader key
vim.g.mapleader = "\\"
-- utf8
vim.g.encoding = "UTF-8"
-- vim.g.no_plugin_maps = 0
vim.o.fileencoding = "utf-8"
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "120"
-- 新行对齐当前行
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
-- 禁止折行
vim.o.wrap = false
--[[ vim.wo.wrap = true ]]
-- 行结尾可以跳到下一行
vim.o.whichwrap = "b,s,<,>,[,],h,l"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = ""
vim.o.mousescroll = "ver:1,hor:3"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = true
-- smaller updatetime
vim.o.updatetime = 300
-- 等待mappings
vim.o.timeoutlen = 2000
-- vim.o.timeout = false
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "noselect"
-- 样式
-- vim.o.background = "light"
vim.o.termguicolors = true
-- vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
--vim.o.list = true
--vim.o.listchars = "space:·"
-- 补全增强
vim.o.wildmenu = true
vim.o.wildmode = "full"
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
vim.o.grepprg = "rg --vimgrep --smart-case --hidden --follow"
vim.o.selection = "inclusive"
vim.o.fixendofline = true
-- no shell temp file
vim.o.shelltemp = false
-- shell is zsh or powershell
if vim.fn.has("mac") == 1 or vim.fn.has("wsl") == 1 or vim.fn.has("unix") == 1 or vim.fn.has("linux") == 1 then
    vim.o.shell = "zsh"
elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.o.shell = "powershell"
end

-- vim.g.did_load_filetypes = 1
-- set python3 path
if vim.fn.executable("/opt/homebrew/bin/python3") == 1 then
    vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
else
    vim.g.python3_host_prog = "/usr/bin/python3"
end
-- disable ruby and perl
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- set language to english
vim.api.nvim_exec("language en_US.UTF-8", true)
-- lazyredraw
vim.o.lazyredraw = true
-- number add or sub format recognize
vim.o.nrformats = "alpha,bin,hex,unsigned"
-- history length
vim.o.history = 1000
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.guicursor =
"i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff500-blinkon500,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
if vim.g.neovide then
    -- set for neovide
    if vim.fn.has("wsl") == 1 or
        vim.fn.has("win32") == 1 or
        vim.fn.has("win64") == 1 then
        vim.o.guifont = "JetBrainsMonoNL NF"
    elseif vim.fn.has("linux") == 1 or
        vim.fn.has("unix") == 1 or
        vim.fn.has("mac") == 1 then
        vim.o.guifont = "JetBrainsMonoNL Nerd Font:h16"
    end
    -- cursor theme
    -- railgun, torpedo, pixiedust
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_scale_factor = 1.0
    vim.o.linespace = 0
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
    -- Helper function for transparency formatting
    -- vim.g.transparency = 0.9
    -- local alpha = function()
    --     return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
    -- end
    -- -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- vim.g.neovide_transparency = 0.0
    -- vim.g.neovide_background_color = "#0f1117" .. alpha()
end

vim.o.pumblend = 10
vim.o.pumheight = 12
vim.opt.path = vim.opt.path + "**"
vim.o.undofile = true
vim.o.undolevels = 200
vim.o.dictionary = vim.fn.stdpath("config") .. "/data/dict/google-10000-english.txt"
vim.o.jumpoptions = vim.o.jumpoptions .. "stack"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
