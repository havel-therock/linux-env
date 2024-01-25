vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },      -- this a a pattern to match the file eg. *.cpp or *.py
    command = [[%s/\s\+$//e]],
})

