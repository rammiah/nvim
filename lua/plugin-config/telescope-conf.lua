local map = require("local-util").KeyMap
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

map("n", "<leader>ff", ':lua require("telescope.builtin").find_files(' ..
    '{ find_command = { "fd", "--type", "f", "--strip-cwd-prefix", ' ..
    ' "-E", "kitex_gen/", "-E", "thrift_gen/" } })<CR>')

map("n", "<leader>fg", ':lua require("telescope.builtin").live_grep({ vimgrep_arguments = { "rg", ' ..
    ' "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", ' ..
    ' "--iglob", "!.git/", "--iglob", "!thrift_gen/", "--iglob", "!kitex_gen/", } })<CR>')

map("n", "<leader>fb", ':lua require("telescope.builtin").buffers()<CR>')
-- map("n", "<leader>ft", ':lua require("telescope.builtin").tags()<CR>')
map("n", "<leader>fh", ':lua require("telescope.builtin").help_tags()<CR>')
map("n", "<leader>fc", ':lua require("telescope.builtin").commands()<CR>')
map("n", "<leader>fq", ':lua require("telescope.builtin").quickfix()<CR>')
map("n", "<leader>fr", ':lua require("telescope.builtin").resume()<CR>')
map("n", "<leader>fs", ':lua require("telescope.builtin").git_status()<CR>')

require("telescope").setup({
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
            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

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
            },
        },
        layout_config = {
            horizontal = {
                width = 0.8,
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
        }
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
        }
    }
})

-- end
require("telescope").load_extension("fzf")
-- require("telescope").load_extension("lazygit")
require("telescope").load_extension("coc")
require("telescope").load_extension("neoclip")
