if not require("localutils").safe_load("nvim-ts-autotag") then
    return
end

require("nvim-ts-autotag").setup({
    filetypes = {
        "glimmer",
        "handlebars",
        "hbs",
        "html",
        "javascript",
        "javascriptreact",
        "jsx",
        "markdown",
        "php",
        "rescript",
        "svelte",
        "tsx",
        "typescript",
        "typescriptreact",
        "vue",
        "xml",
    },

    skip_tags = {
        "area",
        "base",
        "br",
        "col",
        "command",
        "embed",
        "hr",
        "img",
        "input",
        "keygen",
        "link",
        "menuitem",
        "meta",
        "param",
        "slot",
        "source",
        "track",
        "wbr",
    }
})
