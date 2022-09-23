if not require("localutils").safe_load("colorizer") then
    return
end

-- Exclude some filetypes from highlighting by using `!`
require 'colorizer'.setup {
    '*'; -- Highlight all files, but customize some others.
    '!vim'; -- Exclude vim from highlighting.
    -- Exclusion Only makes sense if '*' is specified!
    css = {
        rgb_fn = true,
    }
}
