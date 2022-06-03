vim.g.mapleader = "\\"
-- vim.g.maplocalleader = ";"
-- 保存本地变量
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
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
-- map("n", "<leader>tn", ":tabnext<CR>", opt)
-- map("n", "<leader>tp", ":tabprevious<CR>", opt)
-- nvim-treesitter 代码格式化

vim.cmd([[
" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocHasProvider('hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" map for format key use editor.action.formatDocument
nnoremap <silent> <leader>i :call FormatDocument()<CR>
function! FormatDocument()
    if CocHasProvider('format')
        call CocActionAsync('format')
    else
        call feedkeys('gg=G', 'in')
    endif
endfunction
]])

map("n", "<leader>rn", ":call CocActionAsync('rename')<CR>", opt)
map("n", "<space>a", ":CocList diagnostics<CR>", opt)
map("n", "<space>o", ":CocList outline<CR>", opt)
map("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>", opt)
map("n", "gt", ":call CocActionAsync('jumpTypeDefinition')<CR>", opt)
map("n", "gi", ":call CocActionAsync('jumpImplementation')<CR>", opt)
map("n", "gr", ":call CocActionAsync('jumpReferences')<CR>", opt)

-- tag
map("n", "<leader>tag", ":!ctags -R<CR>", { noremap = true })
-- Files

map("v", "<leader>cp", ":OSCYank<CR>", opt)

-- githunk jump
map("n", ']h', '<Plug>(GitGutterNextHunk)', opt)
map('n', '[h', '<Plug>(GitGutterPrevHunk)', opt)

local pluginKeys = {}

return pluginKeys
