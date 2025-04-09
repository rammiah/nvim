return {
    "mbbill/undotree",
    config = function()
        vim.g.undotree_WindowLayout = 3
        vim.g.undotree_DiffAutoOpen = 1
        vim.g.undotree_SetFocusWhenToggle = 1
        -- vim.g.undotree_DiffCommand = "delta"
        vim.g.undotree_ShortIndicators = 1
    end,
    lazy = true,
    cmd = {
        "UndoTreeToggle",
        "UndoTreeShow",
        "UndoTreeHide",
        "UndoTreeFocus",
    },
}
