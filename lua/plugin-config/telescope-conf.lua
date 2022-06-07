local map = require('local-util').KeyMap
local builtin = require('telescope.builtin')

map('n', '<leader>ff', ':lua require("telescope.builtin").find_files(' ..
    '{ find_command = { "fd", "--type", "f", "--color", "never", ' ..
    ' "-E", ".git/", "--strip-cwd-prefix", "-E", "kitex_gen/", "-E", "thrift_gen/" } })<CR>')

map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>ft', ':lua require("telescope.builtin").tags()<CR>')
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<leader>fc', ':lua require("telescope.builtin").commands()<CR>')
map('n', '<leader>fq', ':lua require("telescope.builtin").quickfix()<CR>')

require('telescope').setup({
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
        },
        default_mappings = true,
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
        },
        layout_config = {
            bottom_pane = {
                height = 25,
                preview_cutoff = 120,
                prompt_position = "top"
            },
            center = {
                height = 0.4,
                preview_cutoff = 40,
                prompt_position = "top",
                width = 0.5
            },
            cursor = {
                height = 0.9,
                preview_cutoff = 40,
                width = 0.8
            },
            horizontal = {
                height = 0.9,
                preview_cutoff = 120,
                prompt_position = "bottom",
                width = 0.8
            },
            vertical = {
                height = 0.9,
                preview_cutoff = 40,
                prompt_position = "bottom",
                width = 0.8
            }
        },
        file_previewer = require "telescope.previewers".cat.new,
        grep_previewer = require "telescope.previewers".vimgrep.new,
        qlist_previewer = require "telescope.previewers".qflist.new,
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker,
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
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
require('telescope').load_extension('fzf')
require('telescope').load_extension('lazygit')
require('telescope').load_extension('coc')
require('telescope').load_extension('neoclip')
