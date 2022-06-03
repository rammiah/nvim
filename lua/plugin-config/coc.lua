local map = require('local-util').KeyMap

vim.cmd([[
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call CocActionAsync('highlight')
]])

map('n', '[g', '<Plug>(coc-diagnostic-prev)')
map('n', ']g', '<Plug>(coc-diagnostic-next)')

vim.g.coc_global_extensions = {
    'coc-go',
    'coc-spell-checker',
    'coc-sumneko-lua',
    'coc-json',
    'coc-yaml',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-pyright',
    'coc-highlight',
    'coc-sh',
    'coc-rust-analyzer'
}
