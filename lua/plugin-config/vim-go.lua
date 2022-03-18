vim.cmd([[
"let g:go_def_mode='gopls'
"let g:go_info_mode='gopls'
let g:go_gopls_enabled = 0
" let g:go_code_completion_icase = 1
let g:go_test_timeout = '100s'

let g:go_highlight_functions = 0
let g:go_highlight_function_calls = 0
let g:go_highlight_methods = 0
let g:go_highlight_fields = 0
let g:go_highlight_types = 0
let g:go_highlight_variable_declarations = 0
let g:go_highlight_operators = 0
let g:go_highlight_structs = 0
let g:go_highlight_interfaces = 0

let g:go_fmt_fail_silently = 0
let g:go_jump_to_error = 1

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 0
let g:go_imports_autosave = 0
let g:go_list_type = "quickfix"
" autocmd FileType go let b:go_fmt_options = {
"      \ 'goimports': '-local ' .
"        \ trim(system('{cd '. shellescape(expand('%:h')) .' && go list -m;}')),
"      \ }

"let g:go_doc_popup_window = 1
" let g:go_auto_type_info = 1
" disable vim-go :GoDef short cut (gd)
"this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
]])
