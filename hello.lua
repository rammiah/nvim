local uv = vim.loop

local tbl = uv.fs_stat("new.txt")
print("file size is "..tostring(tbl.size))

-- local ft = vim.filetype.match({
--     filename = "go.mod",
-- })
--
-- print("filetype is " .. vim.inspect(ft))
