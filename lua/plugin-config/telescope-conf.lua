local map = require("localutils").KeyMap
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local view = require("nvim-tree.view")

local opts = {
    silent = true,
    noremap = true,
}

vim.keymap.set("n", "<leader>ff", function()
    if view.is_visible() then
        view.close()
    end
    builtin.find_files({
        find_command = {
            "fd",
            "--type", "f",
            "--strip-cwd-prefix",
            "-E", "kitex_gen/",
            "-E", "thrift_gen/",
            "-E", "node_modules/",
        }
    })
end, opts)

vim.keymap.set("n", "<leader>fg", function()
    if view.is_visible() then
        view.close()
    end
    builtin.live_grep({
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--iglob", "!.git/",
            "--iglob", "!thrift_gen/",
            "--iglob", "!kitex_gen/",
            "--iglob", "!node_modules/",
        }
    })
end, opts)

vim.keymap.set("n", "<leader>fb", function()
    if view.is_visible() then
        view.close()
    end
    builtin.buffers()
end, opts)

vim.keymap.set("n", "<leader>fr", function()
    if view.is_visible() then
        view.close()
    end
    builtin.resume()
end, opts)

vim.keymap.set("n", "<leader>fs", function()
    -- check cwd is in a git repo
    local git_dir = vim.fn.finddir(".git", vim.fn.getcwd() .. ";")
    local git_file = vim.fn.findfile(".git", vim.fn.getcwd() .. ";")
    if git_dir == "" and git_file == "" then
        print("Not a git repo")
        return
    end
    if view.is_visible() then
        view.close()
    end
    builtin.git_status()
end, opts)

vim.keymap.set("n", "<leader>fl", function()
    if view.is_visible() then
        view.close()
    end
    builtin.current_buffer_fuzzy_find()
end, opts)

-- map("n", "<leader>ft", ':lua require("telescope.builtin").tags()<CR>')
-- map("n", "<leader>fh", ':lua require("telescope.builtin").help_tags()<CR>')
-- map("n", "<leader>fc", ':lua require("telescope.builtin").commands()<CR>')
-- map("n", "<leader>fq", ':lua require("telescope.builtin").quickfix()<CR>')

local telescope = require("telescope")

telescope.setup({
    defaults = {
        -- this is used for find_files
        file_ignore_patterns = {
        },
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--no-ignore",
            "--hidden",
            "--iglob", "!.git",
        },
        default_mappings = nil,
        mappings = {
            i = {
                -- ["<C-n>"] = actions.move_selection_next,
                -- ["<C-p>"] = actions.move_selection_previous,
                ["<C-n>"] = false,
                ["<C-p>"] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,
                -- ["<C-\\>"] = actions.close,

                -- hop.hop_toggle_selection
                ["<C-h>"] = telescope.extensions.hop.hop,
                -- custom hop loop to multi selects and sending selected entries to quickfix list
                ["<C-space>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist + actions.open_qflist,
                    }
                    telescope.extensions.hop._hop_loop(prompt_bufnr, opts)
                end,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = false,
                ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
                ["<C-w>"] = { "<c-s-w>", type = "command" },
                ["<Del>"] = actions.delete_buffer,
            },

            n = {
                ["<esc>"] = actions.close,
                -- ["<C-\\>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                -- hop.hop_toggle_selection
                ["<C-h>"] = telescope.extensions.hop.hop,
                -- custom hop loop to multi selects and sending selected entries to quickfix list
                ["<C-space>"] = function(prompt_bufnr)
                    local opts = {
                        callback = actions.toggle_selection,
                        loop_callback = actions.send_selected_to_qflist,
                    }
                    require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
                end,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- TODO: This would be weird if we switch the ordering.
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
                ["<Del>"] = actions.delete_buffer,
            },
        },
        layout_config = {
            horizontal = {
                width = 0.9,
                height = 0.9,
                prompt_position = "bottom",
                preview_cutoff = 120,
            },

            vertical = {
                width = 0.8,
                height = 0.9,
                prompt_position = "bottom",
                preview_cutoff = 40,
            },

            center = {
                width = 0.5,
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
            },

            cursor = {
                width = 0.8,
                height = 0.9,
                preview_cutoff = 40,
            },

            bottom_pane = {
                height = 25,
                prompt_position = "top",
                preview_cutoff = 120,
            },
        },
        file_previewer = require "telescope.previewers".cat.new,
        grep_previewer = require "telescope.previewers".vimgrep.new,
        qlist_previewer = require "telescope.previewers".qflist.new,
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
        prompt_prefix = " ",
        dynamic_preview_title = false,
        winblend = 0,
        selection_caret = "→ ",
        multi_icon = "*",
        path_display = {
            truncate = 3,
        },
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "-H", "-I", "-E", ".git/" }
        },
        buffers = {
            -- sort_lastused = true,
            sort_mru = true, -- include sort_lastused
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        },
        hop = {
            -- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
            keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";",
                "q", "w", "e", "r", "t", "y", "u", "i", "o", "p",
                "A", "S", "D", "F", "G", "H", "J", "K", "L", ":",
                "Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", },
            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = { "WarningMsg", "Title" },
            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = { "CursorLine", "Normal" },
            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true,
        },
    }
})

require("telescope").load_extension("fzf")
require("telescope").load_extension('hop')
