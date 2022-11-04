local uv = vim.loop

local tbl = uv.fs_stat("hello.lua")
print("file size is " .. tostring(tbl and tbl.size or "no file"))

local ft = vim.filetype.match({
    filename = "hello.java",
})

print("filetype is " .. vim.inspect(ft))
