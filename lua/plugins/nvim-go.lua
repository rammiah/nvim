return {
    "rammiah/nvim-go",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "rcarriga/nvim-notify",
    },
    lazy = true,
    ft = {
        "go",
        "gomod",
    },
    config = function()
        require("go").setup({
            -- notify: use nvim-notify
            notify = true,
            notify_config = {
                timeout = 300,
                info_timeout = 200,
                warn_timeout = 300,
                error_timeout = 500,
            },
            -- auto commands
            auto_format = true,
            auto_lint = false,
            -- linters: revive, errcheck, staticcheck, golangci-lint
            linter = "revive",
            -- linter_flags: e.g., {revive = {"-config", "/path/to/config.yml"}}
            linter_flags = {},
            -- lint_prompt_style: qf (quickfix), vt (virtual text)
            lint_prompt_style = "qf",
            -- formatter: goimports, gofmt, gofumpt
            formatter = "goimports",
            -- test flags: -count=1 will disable cache
            test_flags = { "-v", "-count=1", "-failfast", "-gcflags=all=-l" },
            test_timeout = "300s",
            test_env = {},
            -- show test result with popup window
            test_popup = true,
            test_popup_auto_leave = false,
            test_popup_width = 80,
            test_popup_height = 10,
            -- test open
            test_open_cmd = "edit",
            -- struct tags
            tags_name = "json",
            -- tags_options = {"json=omitempty"},
            tags_options = { "json=omitempty" },
            tags_transform = "snakecase",
            tags_flags = { "-skip-unexported" },
            -- quick type
            quick_type_flags = { "--just-types" },
        })
    end
}
