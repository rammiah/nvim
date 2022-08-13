vim.cmd[[
" close all buffers except current one
command! BufOnly execute '%bdelete|edit#|bdelete#'
]]
