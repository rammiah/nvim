local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  cmd = {"gopls", "-remote=unix;/tmp/gopls-daemon-socket", "-logfile=auto", "-debug=\"\"", "-rpc.trace"},
  filetypes = {"go", "gomod"},
  root_dir = util.root_pattern("go.work", "go.mod", "vendor/"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

