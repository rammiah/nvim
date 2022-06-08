local map = require('local-util').KeyMap

map("n", "[g", "<Plug>(coc-diagnostic-prev)")
map("n", "]g", "<Plug>(coc-diagnostic-next)")
map("n", "<leader>rn", ":call CocActionAsync('rename')<CR>")
map("n", "<space>a", ":CocList diagnostics<CR>")
map("n", "<space>o", ":CocList outline<CR>")
map("n", "gd", ":call CocActionAsync('jumpDefinition')<CR>")
map("n", "gt", ":call CocActionAsync('jumpTypeDefinition')<CR>")
map("n", "gi", ":call CocActionAsync('jumpImplementation')<CR>")
map("n", "gr", ":call CocActionAsync('jumpReferences')<CR>")

vim.g.coc_global_extensions = {
    "coc-go",
    "coc-spell-checker",
    "coc-sumneko-lua",
    "coc-json",
    "coc-yaml",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-pyright",
    "coc-highlight",
    "coc-sh",
    "coc-rust-analyzer"
}

-- ShowDoc show document or type hover
function _M.ShowHover()
    if vim.fn.CocHasProvider and vim.fn.CocHasProvider('hover') then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_feedkeys("K", "in", false)
    end
end

function _M.OrganizeImports()
    local actions = vim.fn.CocAction("codeActions", "", { "source.organizeImports" })
    -- print('actions is ' .. vim.inspect(actions))

    if #actions ~= 0 then
        vim.fn.CocAction('organizeImport')
    end
end

-- FormatDoc will format buffer by language server
function _M.FormatDoc()
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- if bufnr.filetype == 'go' then
    --     print('file type is go')
    -- end
    -- go.format is too slow for big project, use coc organizeImports and formatDocument
    _M.OrganizeImports()

    local nvim_go = require("go.format")
    if vim.fn.CocHasProvider and vim.fn.CocHasProvider("format") then
        vim.fn.CocActionAsync("format")
    elseif vim.bo.ft == "go" and nvim_go and nvim_go.format then
        nvim_go.format()
    else
        local view = vim.fn.winsaveview()
        -- print("view saved is " .. vim.inspect(view))
        vim.api.nvim_feedkeys("gg=G", "in", false)
        vim.fn.winrestview(view)
    end
end

-- Use K to show documentation in preview window.
map("n", "K", ":lua _M.ShowHover()<CR>")
-- map for format key use editor.action.formatDocument
map("n", "<leader>i", ":lua _M.FormatDoc()<CR>")

vim.cmd([[
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" autocmd CursorHold * silent call CocActionAsync('highlight')
]])

