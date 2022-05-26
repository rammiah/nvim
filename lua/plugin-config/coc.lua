vim.cmd([[
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  " autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" autocmd CursorHold * silent call CocActionAsync('highlight')
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
""inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
""                             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" autocmd BufWritePre *.go call CocAction('runCommand', 'editor.action.organizeImport')
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.formatDocument') | call CocAction('runCommand', 'editor.action.organizeImport')
" Add `:Format` command to format current buffer.
"" ommand! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')
]])
