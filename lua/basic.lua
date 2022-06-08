-- utf8
vim.g.encoding = "UTF-8"
-- vim.g.no_plugin_maps = 0
vim.o.fileencoding = 'utf-8'
-- jk移动时光标下上方保留8行
-- vim.o.scrolloff = 8
-- vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
-- vim.wo.relativenumber = true
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
vim.o.hlsearch = false
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
-- 禁止折行
vim.o.wrap = true
vim.wo.wrap = true
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "nv"
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
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- always show tabline
vim.o.showtabline = 2
vim.o.grepprg = 'rg --vimgrep --smart-case --hidden --follow'
vim.o.selection = 'inclusive'
-- don't add '\n' to end of file
vim.o.fixendofline = false
-- no shell temp file
vim.o.shelltemp = false
-- shell is zsh
vim.o.shell = 'zsh'
-- vim.g.did_load_filetypes = 1
-- set python3 path
vim.g.python3_host_prog = '/usr/bin/python3'
-- disable ruby
vim.g.loaded_ruby_provider = false
-- set language to english
vim.api.nvim_exec('language en_US.UTF-8', true)
-- lazyredraw
vim.o.lazyredraw = true
