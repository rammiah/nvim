if not require("local-util").safe_load("nvim-tree") then
    return
end

local map = require("local-util").KeyMap

map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")
-- map("n", "<leader>r", ":NvimTreeRefresh<CR>")
-- map("n", "<C-f>", "<Cmd>NvimTreeFindFile<CR>")

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require "nvim-tree".setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    create_in_closed_folder = true,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = false,
    view = {
        adaptive_size = true,
        centralize_selection = true,
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "no",
        mappings = {
            custom_only = true,
            list = {
                -- BEGIN_DEFAULT_MAPPINGS
                { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
                -- { key = "<C-e>", action = "edit_in_place" },
                { key = "O", action = "edit_no_picker" },
                { key = { "<C-]>", "<2-RightMouse>" }, action = "cd" },
                { key = "<C-v>", action = "vsplit" },
                { key = "<C-x>", action = "split" },
                { key = "<C-t>", action = "tabnew" },
                { key = "<", action = "prev_sibling" },
                { key = ">", action = "next_sibling" },
                { key = "P", action = "parent_node" },
                { key = "<BS>", action = "close_node" },
                { key = "<Tab>", action = "preview" },
                -- { key = "K", action = "first_sibling" },
                -- { key = "J", action = "last_sibling" },
                { key = "I", action = "toggle_git_ignored" },
                { key = "H", action = "toggle_dotfiles" },
                -- { key = "U", action = "toggle_custom" },
                { key = "R", action = "refresh" },
                { key = "a", action = "create" },
                { key = "D", action = "remove" },
                { key = "d", action = "trash" },
                { key = "r", action = "rename" },
                { key = "<C-r>", action = "full_rename" },
                { key = "x", action = "cut" },
                -- { key = "c", action = "copy" },
                { key = "y", action = "copy" },
                { key = "p", action = "paste" },
                -- { key = "y", action = "copy_name" },
                { key = "c", action = "copy_name" },
                { key = "C", action = "copy_path" },
                { key = "gy", action = "copy_absolute_path" },
                -- { key = "[c", action = "prev_git_item" },
                -- { key = "]c", action = "next_git_item" },
                { key = "[h", action = "prev_git_item" },
                { key = "]h", action = "next_git_item" },
                { key = "-", action = "dir_up" },
                -- { key = "s", action = "system_open" },
                { key = "f", action = "live_filter" },
                { key = "F", action = "clear_live_filter" },
                { key = "q", action = "close" },
                { key = "W", action = "collapse_all" },
                { key = "E", action = "expand_all" },
                { key = "S", action = "search_node" },
                { key = ".", action = "run_file_command" },
                { key = "<C-k>", action = "toggle_file_info" },
                { key = "g?", action = "toggle_help" },
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└",
                item = "├",
                edge = "│",
                none = " ",
            },
            inline_arrows = true,
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " → ",
            show = {
                file = true,
                folder = true, -- 优先级低于indent_makers
                folder_arrow = false,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    -- dont use
    system_open = {
        cmd = "nvim",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 1000,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
        },
        open_file = {
            quit_on_open = true,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = false,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = true,
        types = {
            all = true,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
}
