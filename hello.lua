local ft = vim.filetype.match({
    filename = "go.mod",
})

print("filetype is " .. vim.inspect(ft))
