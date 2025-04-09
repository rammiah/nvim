return {
    "lambdalisue/suda.vim",
    config = function()
        vim.g.suda_smart_edit = 0
        vim.g["suda#prompt"] = "password: "
    end,
    lazy = true,
    cmd = {
        "SudaWrite",
        "SudaRead",
    },
}
