local M = {}

function M.KeyMap(mode, key, cmd, opts)
    local default = {
        noremap = true,
        silent = true,
    }
    opts = vim.tbl_extend("force", default, opts or {})
    vim.api.nvim_set_keymap(mode, key, cmd, opts)
end

function M.safe_load(name, msg, level)
    local ok, _ = pcall(require, name)
    if not ok then
        vim.notify(msg or name .. " is not installed", level or vim.log.levels.ERROR)
    end
    return ok
end

return M
