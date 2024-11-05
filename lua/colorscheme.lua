local colorscheme = "catppuccin-latte"
vim.o.background = "light"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " not found!")
    return
end
-- vim.cmd [[ hi CursorLine guibg=#f4ede8 guisp=#cecacd ]]
