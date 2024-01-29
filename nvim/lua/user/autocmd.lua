-- remove trailing whitespaces on write
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },      -- this a a pattern to match the file eg. *.cpp or *.py
    command = [[%s/\s\+$//e]],
})

-- auto closing brackets in source files
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.cpp", "*.h", "*.hpp", "*.c" },
  callback = function(event)
    vim.keymap.set('i', '{', '{<CR>}<Esc>O', { buffer = event.buf })
  end,
})

