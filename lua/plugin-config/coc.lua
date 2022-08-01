local map = require('local-util').KeyMap

map("n", "[g", "<Plug>(coc-diagnostic-prev)")
map("n", "]g", "<Plug>(coc-diagnostic-next)")
map("n", "<leader>rn", "<Cmd>call CocActionAsync('rename')<CR>")
-- goto
map("n", "gd", "<Cmd>call CocActionAsync('jumpDefinition')<CR>")
map("n", "gt", "<Cmd>call CocActionAsync('jumpTypeDefinition')<CR>")
map("n", "gi", "<Cmd>call CocActionAsync('jumpImplementation')<CR>")
map("n", "gr", "<Cmd>call CocActionAsync('jumpReferences')<CR>")
-- coc-list
map("n", "<space>j", "<Cmd>CocNext<CR>", { nowait = true })
map("n", "<space>k", "<Cmd>CocPrev<CR>", { nowait = true })
map("n", "<space>p", "<Cmd>CocListResume<CR>", { nowait = true })
map("n", "<space>a", "<Cmd>CocList diagnostics<CR>", { nowait = true })
map("n", "<space>o", "<Cmd>CocList outline<CR>", { nowait = true })
map("n", "<space>c", "<Cmd>CocList commands<CR>", { nowait = true })
-- code actions
map("n", "<leader>cc", "<Plug>(coc-codeaction-cursor)")
map("v", "<leader>a", "<Plug>(coc-codeaction-selected)")
map("n", "<leader>a", "<Plug>(coc-codeaction-selected)")

vim.cmd [[
  hi CocSearch ctermfg=12 guifg=#18A3FF
  hi CocMenuSel ctermbg=109 guibg=#ffffff
]]

vim.g.coc_global_extensions = {
    "coc-go",
    "coc-spell-checker",
    "coc-sumneko-lua",
    "coc-json",
    "coc-yaml",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-pyright",
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
    if vim.g.coc_service_initialized == 1 then
        local actions = vim.fn.CocAction("codeActions", "", { "source.organizeImports" })
        -- print('actions is ' .. vim.inspect(actions))

        if #actions ~= 0 then
            vim.fn.CocAction('organizeImport')
        end
    else
        vim.notify("coc not initialized", vim.log.levels.INFO)
    end
end

-- FormatDoc will format buffer by language server
function _M.FormatDoc()
    -- local bufnr = vim.api.nvim_get_current_buf()
    -- if bufnr.filetype == 'go' then
    --     print('file type is go')
    -- end
    -- go.format is too slow for big project, use coc organizeImports to import
    _M.OrganizeImports()

    local nvim_go = require("go.format")
    if vim.bo.ft == "go" and nvim_go and nvim_go.format then
        nvim_go.format()
    elseif vim.g.coc_service_initialized == 1 and vim.fn.CocHasProvider and vim.fn.CocHasProvider("format") then
        vim.fn.CocActionAsync("format")
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
