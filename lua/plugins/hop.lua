return {
    "phaazon/hop.nvim",
    config = function()
        local hint = require("hop.hint")
        local map = require("localutils").KeyMap

        map("n", "<C-h>", "<Cmd>HopWord<CR>")

        -- you can configure Hop the way you like here; see :h hop-config
        require "hop".setup {
            keys = "etovxqpdygfblzhckisuran",
            multi_windows = false,
            hint_position = hint.HintPosition.BEGIN,
            uppercase_labels = false,
        }
    end,
    lazy = true,
    keys = {
        "<C-h>",
    },
}
