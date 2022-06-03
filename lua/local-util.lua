local M = {}

function M.KeyMap(mode, key, cmd, opts)
    local opts = opts or {
        noremap = true,
        silent = true,
    }
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

return M
