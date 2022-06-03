local map = require('local-util').KeyMap

vim.g.mapleader = "\\"
-- vim.g.maplocalleader = ";"
-- 保存本地变量
-- 持续缩进
map('v', '<', '<gv')
map('v', '>', '>gv')
-- 分屏切换
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")
-- nerdtree
map('n', '<C-n>', ':NERDTreeToggle<CR>')
map('n', '<C-f>', ':NERDTreeFind<CR>')
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

map("n", "<leader>rn", ":call CocActionAsync('rename')<CR>")
map("n", "<space>a", ":CocList diagnostics<CR>")
map("n", "<space>o", ":CocList outline<CR>")
map("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>")
map("n", "gt", ":call CocActionAsync('jumpTypeDefinition')<CR>")
map("n", "gi", ":call CocActionAsync('jumpImplementation')<CR>")
map("n", "gr", ":call CocActionAsync('jumpReferences')<CR>")

-- tag
map("n", "<leader>tag", ":!ctags -R<CR>", { noremap = true })
-- Files

map("v", "<leader>cp", ":OSCYank<CR>")

-- githunk jump
map("n", ']h', '<Plug>(GitGutterNextHunk)')
map('n', '[h', '<Plug>(GitGutterPrevHunk)')

local pluginKeys = {}

return pluginKeys
