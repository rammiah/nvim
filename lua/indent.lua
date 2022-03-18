vim.cmd([[
" only not expand tab for golang
autocmd FileType go setlocal shiftwidth=4 tabstop=4 noexpandtab autoindent
" expandtab for other files
autocmd FileType python,json,yaml setlocal shiftwidth=2 softtabstop=2 expandtab autoindent
autocmd FileType thrift,c,cpp setlocal shiftwidth=4 tabstop=4 expandtab autoindent
autocmd BufRead,BufNewFile Caddyfile setlocal shiftwidth=4 tabstop=4 noexpandtab autoindent
]])
