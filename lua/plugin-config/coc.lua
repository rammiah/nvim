local map = require('localutils').KeyMap

map("n", "[g", "<Plug>(coc-diagnostic-prev)")
map("n", "]g", "<Plug>(coc-diagnostic-next)")
map("n", "<leader>rn", "<Cmd>call CocActionAsync('rename')<CR>")
-- goto
map("n", "gd", "<Cmd>call CocActionAsync('jumpDefinition', 'edit')<CR>")
map("n", "gD", "<Cmd>call CocActionAsync('jumpDefinition', 'tabe')<CR>")
map("n", "gy", "<Cmd>call CocActionAsync('jumpTypeDefinition', 'edit')<CR>")
map("n", "gY", "<Cmd>call CocActionAsync('jumpTypeDefinition', 'tabe')<CR>")
map("n", "gi", "<Cmd>call CocActionAsync('jumpImplementation', 'edit')<CR>")
map("n", "gI", "<Cmd>call CocActionAsync('jumpImplementation','tabe')<CR>")
map("n", "gr", "<Cmd>call CocActionAsync('jumpReferences', 'edit')<CR>")
map("n", "gR", "<Cmd>call CocActionAsync('jumpReferences', 'tabe')<CR>")
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

-- #657b83 #ffffd7
vim.cmd [[
  hi CocFloating guifg=#000000 guibg=#e4e4e4 "#f7f7f7
  hi CocSearch ctermfg=12 guifg=#2470b3
  "hi CocMenuSel ctermbg=109 guifg=#000000 guibg=#c5dffc
  hi CocMenuSel guibg=#ffffd7    "#c5dffc
]]

-- global options
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

vim.g.coc_disable_transparent_cursor = 0
vim.g.coc_enable_locationlist = 1

-- format options
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
    -- _M.OrganizeImports()

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
