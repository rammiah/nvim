return {
    'dnlhc/glance.nvim',
    -- cmd = 'Glance',
    config = function()
        vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
        vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
        vim.keymap.set('n', 'gy', '<CMD>Glance type_definitions<CR>')
        vim.keymap.set('n', 'gi', '<CMD>Glance implementations<CR>')
        require('glance').setup({
            hooks = {
                before_open = function(results, open, jump, method)
                    if #results == 1 then
                        jump(results[1])
                    else
                        open(results)
                    end
                end,
            }
        })
    end,
}
