vim.cmd([[
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])

vim.g.coc_global_extensions = {
    'coc-go',
    'coc-spell-checker',
    'coc-lua',
    'coc-json',
    'coc-yaml',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-pyright',
    'coc-highlight',
    'coc-sh',
    'coc-rust-analyzer'
}

