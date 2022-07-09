vim.cmd([[
" filetype on
filetype plugin indent on
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
" only not expand tab for golang
autocmd FileType go setlocal noexpandtab
" expandtab for other files
autocmd FileType python,json,yaml setlocal shiftwidth=2 softtabstop=2
" autocmd FileType thrift,c,cpp setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType Caddyfile setlocal noexpandtab
autocmd FileType gitconfig setlocal noexpandtab
]])
