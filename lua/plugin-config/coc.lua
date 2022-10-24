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

vim.cmd [[
  hi CocFloating guifg=#000000 guibg=#e4e4e4
  hi CocSearch ctermfg=12 guifg=#2470b3
  hi CocMenuSel guibg=#ffffd7
]]

-- global options
vim.g.coc_global_extensions = {
    "coc-clangd",
    "coc-dictionary",
    "coc-go",
    "coc-html",
    "coc-json",
    "coc-lists",
    "coc-marketplace",
    "coc-prettier",
    "coc-pyright",
    "coc-rust-analyzer",
    "coc-sh",
    "coc-snippets",
    "coc-spell-checker",
    "coc-sql",
    "coc-sumneko-lua",
    "coc-tag",
    "coc-tsserver",
    "coc-vimlsp",
    "coc-yaml",
}

vim.g.coc_disable_transparent_cursor = 0
vim.g.coc_enable_locationlist = 1

local opts = {
    silent = true,
    noremap = true
}

local function on_hover()
    if vim.fn.CocHasProvider and vim.fn.CocHasProvider('hover') then
        vim.fn.CocActionAsync("doHover")
    else
        vim.api.nvim_feedkeys("K", "in", false)
    end
end

vim.keymap.set("n", "K", on_hover, opts)

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
    -- go.format is too slow for big project, use coc organizeImports to import
    _M.OrganizeImports()

    -- local nvim_go = require("go.format")
    -- if vim.bo.ft == "go" and nvim_go and nvim_go.format then
    --     nvim_go.format()
    -- elseif vim.g.coc_service_initialized == 1 and vim.fn.CocHasProvider and vim.fn.CocHasProvider("format") then
    if vim.g.coc_service_initialized == 1 and vim.fn.CocHasProvider and vim.fn.CocHasProvider("format") then
        vim.fn.CocActionAsync("format")
    else
        local view = vim.fn.winsaveview()
        vim.api.nvim_feedkeys("gg=G", "in", false)
        vim.fn.winrestview(view)
    end
end

-- map for format key use editor.action.formatDocument
map("n", "<leader>=", ":lua _M.FormatDoc()<CR>")
map("i", "<C-j>", "<Plug>(coc-snippets-expand-jump)", { noremap = false })

-- check hover is shown
vim.keymap.set({ "n", "i" }, "<PageDown>", function()
    if vim.fn["coc#float#has_float"]() == 1 then
        vim.fn["coc#float#scroll"](1)
    else
        local key = vim.api.nvim_replace_termcodes("<PageDown>", true, false, true)
        vim.api.nvim_feedkeys(key, "in", true)
    end
end, opts)

vim.keymap.set({ "n", "i" }, "<PageUp>", function()
    if vim.fn["coc#float#has_float"]() == 1 then
        vim.fn["coc#float#scroll"](0)
    else
        local key = vim.api.nvim_replace_termcodes("<PageUp>", true, false, true)
        vim.api.nvim_feedkeys(key, "in", true)
    end
end, opts)

vim.api.nvim_create_autocmd("User", {
    desc = "update signature when jump placeholder",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
})
