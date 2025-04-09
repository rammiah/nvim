return {
    "tiagovla/scope.nvim",
    config = function()
        require("scope").setup {}
    end,
    lazy = true,
    event = "UIEnter",
}
