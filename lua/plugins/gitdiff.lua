return {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        local actions = require("diffview.actions")

        require("diffview").setup({
            diff_binaries = false, -- Show diffs for binaries
            enhanced_diff_hl = false, -- See :h diffview-config-enhanced_diff_hl
            use_icons = true, -- Requires nvim-web-devicons
            icons = {         -- Only applies when use_icons is true.
                folder_closed = "",
                folder_open = "",
            },
            signs = {
                fold_closed = "",
                fold_open = "",
            },
            file_panel = {
                listing_style = "tree",      -- One of list or tree
                tree_options = {             -- Only applies when listing_style is tree
                    flatten_dirs = true,     -- Flatten dirs that only contain one single dir
                    folder_statuses = "only_folded", -- One of never, only_folded or always.
                },
                win_config = {               -- See :h diffview-config-win_config
                    position = "left",
                    width = 35,
                },
            },
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                },
                win_config = { -- See :h diffview-config-win_config
                    position = "bottom",
                    height = 16,
                },
            },
            commit_log_panel = {
                win_config = {}, -- See :h diffview-config-win_config
            },
            default_args = { -- Default args prepended to the arg-list for the listed commands
                DiffviewOpen = {},
                DiffviewFileHistory = {},
            },
            hooks = {},          -- See :h diffview-config-hooks
            keymaps = {
                disable_defaults = true, -- Disable the default keymaps
                view = {
                    -- The `view` bindings are active in the diff buffers, only when the current
                    -- tabpage is a Diffview.
                    ["<tab>"]     = actions.select_next_entry, -- Open the diff for the next file
                    ["<s-tab>"]   = actions.select_prev_entry, -- Open the diff for the previous file
                    ["gf"]        = actions.goto_file_tab, -- Open the file in a new split in previous tabpage
                    ["<leader>b"] = actions.toggle_files, -- Toggle the files panel.
                },
                file_panel = {
                    ["j"]         = actions.next_entry, -- Bring the cursor to the next file entry
                    ["<down>"]    = actions.next_entry,
                    ["k"]         = actions.prev_entry, -- Bring the cursor to the previous file entry.
                    ["<up>"]      = actions.prev_entry,
                    ["<cr>"]      = actions.select_entry, -- Open the diff for the selected entry.
                    ["o"]         = actions.select_entry,
                    ["S"]         = actions.stage_all,  -- Stage all entries.
                    ["U"]         = actions.unstage_all, -- Unstage all entries.
                    ["X"]         = actions.restore_entry, -- Restore entry to the state on the left side.
                    ["R"]         = actions.refresh_files, -- Update stats and entries in the file list.
                    ["L"]         = actions.open_commit_log, -- Open the commit log panel.
                    ["<c-u>"]     = actions.scroll_view(-0.25), -- Scroll the view up
                    ["<c-d>"]     = actions.scroll_view(0.25), -- Scroll the view down
                    ["<tab>"]     = actions.select_next_entry,
                    ["<s-tab>"]   = actions.select_prev_entry,
                    ["gf"]        = actions.goto_file_tab,
                    ["`"]         = actions.listing_style, -- Toggle between list and tree views
                    ["f"]         = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
                    ["<leader>b"] = actions.toggle_files,
                },
                file_history_panel = {
                    ["g!"]        = actions.options,  -- Open the option panel
                    ["<C-A-d>"]   = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
                    ["y"]         = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
                    ["L"]         = actions.open_commit_log,
                    ["zR"]        = actions.open_all_folds,
                    ["zM"]        = actions.close_all_folds,
                    ["j"]         = actions.next_entry,
                    ["<down>"]    = actions.next_entry,
                    ["k"]         = actions.prev_entry,
                    ["<up>"]      = actions.prev_entry,
                    ["<cr>"]      = actions.select_entry,
                    ["o"]         = actions.select_entry,
                    ["<c-u>"]     = actions.scroll_view(-0.25),
                    ["<c-d>"]     = actions.scroll_view(0.25),
                    ["<tab>"]     = actions.select_next_entry,
                    ["<s-tab>"]   = actions.select_prev_entry,
                    ["gf"]        = actions.goto_file_tab,
                    ["<leader>b"] = actions.toggle_files,
                },
                option_panel = {
                    ["<tab>"] = actions.select_entry,
                    ["q"]     = actions.close,
                },
            },
        })
    end,
    lazy = true,
    cmd = {
        "DiffviewOpen",
        "DiffviewFileHistory",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
        "DiffviewRefresh",
        "DiffviewLog",
    },
}
