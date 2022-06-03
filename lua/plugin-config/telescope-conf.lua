local map = require('local-util').KeyMap

map('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
map('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')
map('n', '<leader>fb', ':lua require("telescope.builtin").buffers()<CR>')
map('n', '<leader>ft', ':lua require("telescope.builtin").tags()<CR>')
map('n', '<leader>fh', ':lua require("telescope.builtin").help_tags()<CR>')
map('n', '<leader>fc', ':lua require("telescope.builtin").commands()<CR>')
map('n', '<leader>fq', ':lua require("telescope.builtin").quickfix()<CR>')

require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                -- ["<C-h>"] = "which_key"
            }
        },
        file_previewer = require 'telescope.previewers'.cat.new
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
