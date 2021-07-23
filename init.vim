let mapleader=";"
let plug_path=stdpath('data') . '/plugged'
call plug#begin(plug_path)
" < Other Plugins, if they exist >
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'overcache/NeoSolarized'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
call plug#end()
" -------------------------------------------------------------------------------------------------

let g:rainbow_active = 1

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
"set updatetime=300
" don't give |ins-completion-menu| messages.
"set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> U :call <SID>show_documentation()<CR>
inoremap <expr> <Tab> pumvisible() ? "\<CR>" : "\<Tab>"
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims=1

"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
let g:go_code_completion_icase = 1
let g:go_test_timeout = '100s'
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_gopls_enabled = 0

"let g:go_doc_popup_window = 1
" let g:go_auto_type_info = 1
" disable vim-go :GoDef short cut (gd)
"this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'ERR:'
let airline#extensions#coc#warning_symbol = 'WARN:'
let g:airline_theme = 'solarized'

" set git blame
"let g:blamer_show_in_insert_modes = 0
"let g:blamer_show_in_visual_modes = 0
"let g:rainbow_active = 1
" git gitgutter
let g:gitgutter_map_keys = 0
" auto exit
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" auto open nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" Your vimrc
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" other settings
syntax on
set number
set shiftwidth=4
set tabstop=4
set autoindent
set cindent
set showcmd
set smartindent
filetype on
filetype plugin on
filetype indent on
set background=light "dark or light
colorscheme NeoSolarized
set cursorline
highlight Cursorline cterm=bold
set encoding=utf8
set updatetime=100 " gitgutter refresh time
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set termguicolors
