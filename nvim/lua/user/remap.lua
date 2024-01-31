-- my leader
vim.g.mapleader = " "


-- general
vim.keymap.set('n', '<leader>pv', function() vim.cmd("Ex") end)

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

vim.keymap.set('x', '<leader>p', '\"_dP')


-- disable
vim.keymap.set('n', 'Q', '<nop>')


-- fancy
vim.keymap.set('n', '<leader>fr',
function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    vim.cmd('%!clang-format')
    vim.cmd(tostring(row))
end)


vim.keymap.set('n', '<leader>af',
function()
    vim.lsp.buf.code_action()
end)
