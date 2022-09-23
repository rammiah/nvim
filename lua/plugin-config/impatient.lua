_G.__luacache_config = {
  chunks = {
    enable = true,
    path = vim.fn.stdpath("cache").."/luacache_chunks",
  },
  modpaths = {
    enable = true,
    path = vim.fn.stdpath("cache").."/luacache_modpaths",
  }
}


if not require("localutils").safe_load("impatient") then
    return
end

require('impatient')
