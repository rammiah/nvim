local map = require("localutils").KeyMap
local lib = require("nvim-tree.lib")
local api = require("nvim-tree.api")
local treeutils = require("treeutils")

map("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")

local function edit_or_open()
    -- open as vsplit on current node
    local action = "edit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        -- 链接到文件
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
        api.tree.close() -- Close the tree if file was opened
    elseif node.nodes ~= nil then
        -- 文件夹节点
        lib.expand_or_collapse(node)
    elseif node.name == ".." then
        -- 根节点不做操作
    else
        -- 文件节点
        -- print(vim.inspect(node))
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
        api.tree.close() -- Close the tree if file was opened
    end
end

local function split_preview()
    -- open as split on current node
    local action = "split"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    elseif node.name == ".." then
        -- ignore root node
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end

    -- Finally refocus on tree if it was lost
    if not api.tree.is_visible() then
        api.tree.open()
    end
    api.tree.focus()
    api.tree.reload()
end

local function vsplit_preview()
    -- open as vsplit on current node
    local action = "vsplit"
    local node = lib.get_node_at_cursor()

    -- Just copy what's done normally with vsplit
    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    elseif node.name == ".." then
        -- ignore root node
    else
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end

    -- Finally refocus on tree if it was lost
    if not api.tree.is_visible() then
        api.tree.open()
    end
    api.tree.focus()
    api.tree.reload()
end

-- telescope node support
local function custom_callback(callback_name)
    return string.format(":lua require('treeutils').%s()<CR>", callback_name)
end


local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end


    -- Default mappings not inserted as:
    --  remove_keymaps = true
    --  OR
    --  view.mappings.custom_only = true


    -- Mappings migrated from view.mappings.list
    --
    -- You will need to insert "your code goes here" for any mappings with a custom action_cb
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
    vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
    vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
    vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
    vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
    vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))

    vim.keymap.set('n', 'l', function()
        edit_or_open()
    end, opts('Open'))

    vim.keymap.set('n', 'L', function()
        vsplit_preview()
    end, opts('vsplit_preview'))

    vim.keymap.set('n', 'J', function()
        split_preview()
    end, opts('split_preview'))

    vim.keymap.set('n', '<C-f>', function()
        treeutils.launch_find_files()
    end, opts('find_files'))

    vim.keymap.set('n', '<C-g>', function()
        treeutils.launch_live_grep()
    end, opts('live_grep'))

    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
    vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
    vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
    vim.keymap.set('n', 'D', api.fs.remove, opts('Delete'))
    vim.keymap.set('n', 'd', api.fs.trash, opts('Trash'))
    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
    vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
    vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
    vim.keymap.set('n', 'y', api.fs.copy.node, opts('Copy'))
    vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
    vim.keymap.set('n', 'c', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'C', api.fs.copy.relative_path, opts('Copy Relative Path'))
    vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
    vim.keymap.set('n', '[h', api.node.navigate.git.prev, opts('Prev Git'))
    vim.keymap.set('n', ']h', api.node.navigate.git.next, opts('Next Git'))
    vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
    vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
    vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
    vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
    vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
    vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
    vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
    vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
    vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
    vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
end

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require "nvim-tree".setup { -- BEGIN_DEFAULT_OPTS
    auto_reload_on_write = true,
    -- create_in_closed_folder = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_tab = false,
    on_attach = on_attach,
    sort_by = "name",
    sync_root_with_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = false,
    view = {
        adaptive_size = true,
        centralize_selection = true,
        width = 30,
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
    },
    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        root_folder_label = false,
        indent_width = 2,
        indent_markers = {
            enable = true,
            icons = {
                corner = "└",
                item = "├",
                edge = "│",
                none = " ",
                bottom = "─",
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
        -- special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        special_files = {},
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
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
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
            exclude = {
                "kitex_gen",
                "thrift_gen",
                ".git",
                "build",
                "target",
            }
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
