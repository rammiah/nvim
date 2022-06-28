vim.cmd[[
autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
let g:oscyank_silent = v:true  " or 1 for older versions of Vim
let g:oscyank_term = 'default'
]]
