local M = {}

function M.KeyMap(mode, key, cmd, opts)
    local default = {
        noremap = true,
        silent = true,
    }
    opts = vim.tbl_extend("force", default, opts or {})
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

return M
