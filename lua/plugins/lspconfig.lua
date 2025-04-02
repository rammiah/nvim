return {
    'neovim/nvim-lspconfig',
    opts = {
        servers = {
            lua_ls = {},
            gopls = {},
        },
    },
    config = function(_, opts)
        for server, config in pairs(opts.servers) do
            require('lspconfig')[server].setup(config)
        end
    end
}
