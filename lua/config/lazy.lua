require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "single",
    },
    concurrency = 10,
    throttle = 10,
    -- git = {
    --     url_format = "https://gh.i2x.cc/github.com/%s.git",
    -- }
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = 4, ---@type number? set to 1 to check for updates very slowly
        notify = true,                -- get a notification when new updates are found
        frequency = 60 * 60 * 24 * 7, -- check for updates every week
        check_pinned = false,         -- check for pinned packages that can't be updated
    },
})

