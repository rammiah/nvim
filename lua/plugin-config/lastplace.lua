if not require("local-util").safe_load("nvim-lastplace") then
    return
end

require "nvim-lastplace".setup {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true
}
