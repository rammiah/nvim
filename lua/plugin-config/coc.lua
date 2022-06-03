local map = require('local-util').KeyMap

map('n', '[g', '<Plug>(coc-diagnostic-prev)')
map('n', ']g', '<Plug>(coc-diagnostic-next)')
map("n", "<leader>rn", ":call CocActionAsync('rename')<CR>")
map("n", "<space>a", ":CocList diagnostics<CR>")
map("n", "<space>o", ":CocList outline<CR>")
map("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>")
map("n", "gt", ":call CocActionAsync('jumpTypeDefinition')<CR>")
map("n", "gi", ":call CocActionAsync('jumpImplementation')<CR>")
map("n", "gr", ":call CocActionAsync('jumpReferences')<CR>")

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

vim.cmd([[
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call CocActionAsync('highlight')

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

