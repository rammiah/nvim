-- set up for nerd tree
vim.cmd [[
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
]]

vim.g.NERDTreeDirArrowExpandable = '▸'
vim.g.NERDTreeDirArrowCollapsible = '▾'
