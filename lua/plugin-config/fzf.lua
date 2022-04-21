vim.cmd([[
" fzf settings
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'ctrl-x'
]])


local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map('n', "<leader>ff", ":Files<CR>", opt)
map('n', '<leader>ts', ":Tags<CR>", opt)
map('n', '<leader>bs', ":Buffers<CR>", opt)
