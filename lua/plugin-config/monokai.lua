if not require("local-util").safe_load("one_monokai") then
    return
end

require("one_monokai").setup ({ transparent = false,
    colors = {},
    themes = function(colors)
        return {}
    end,
})
