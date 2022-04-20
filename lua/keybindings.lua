vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}
-- 每次移动9行而不是半屏
-- map("n", "<C-u>", "9k", opt)
-- map("n", "<C-d>", "9j", opt)
-- 持续缩进
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)
-- 分屏切换
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- nerdtree
map('n', '<C-n>', ':NERDTreeToggle<CR>', opt)
map('n', '<C-f>', ':NERDTreeFind<CR>', opt)
-- bufferline 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "gb", ":BufferLinePick<CR>", opt)
-- map("n", "<leader>tn", ":tabnext<CR>", opt)
-- map("n", "<leader>tp", ":tabprevious<CR>", opt)
-- nvim-treesitter 代码格式化
map("n", "<leader>i", "gg=G", opt)

-- vim.cmd([[
-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction

-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "<CR>" :
--       \ <SID>check_back_space() ? "<TAB>" :
--       \ coc#refresh()

-- function! s:check_back_space() abort
--   let col = col('.') - 1
--   return !col || getline('.')[col - 1]  =~# '\s'
-- endfunction
-- ]])

vim.cmd([[
" use K to show documentation in previw
function! s:show_doc()
  if &filetype == 'vim'
    exceute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> U :call <SID>show_doc()<CR>
]])

-- map("n", "K", ":call <SID>show_doc()<CR>", opt)
map("n", "<leader>rn", ":call CocActionAsync('rename')<CR>", opt)
map("n", "<space>a", ":CocList diagnostics<CR>", opt)
map("n", "<space>o", ":CocList outline<CR>", opt)
map("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>", opt)
map("n", "gt", ":call CocActionAsync('jumpTypeDefinition')<CR>", opt)
map("n", "gi", ":call CocActionAsync('jumpImplementation')<CR>", opt)
map("n", "gr", ":call CocActionAsync('jumpReferences')<CR>", opt)

-- commenter
map("n", "<C-_>", ":call nerdcommenter#Comment('n', 'toggle')<CR>", opt)
map("v", "<C-_>", ":call nerdcommenter#Comment('x', 'toggle')<CR>gv", opt)
-- tag
map("n", "<leader>tag", ":!ctags -R<CR>", { noremap=true })
-- Files
map('n', "<leader>ff", ":Files<CR>", opt)
map('n', '<leader>ts', ":Tags<CR>", opt)
map('n', '<leader>bs', ":Buffers<CR>", opt)


local pluginKeys = {}


return pluginKeys
