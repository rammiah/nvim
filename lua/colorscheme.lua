vim.o.background = "light"
local colorscheme = "dawnfox"
-- tokyonight
-- OceanicNext
-- gruvbox
-- zephyr
-- nord
-- onedark
-- nightfox
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme: " .. colorscheme .. " not found!")
    return
end
