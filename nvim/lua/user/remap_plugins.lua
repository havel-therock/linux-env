-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.find_files({ cwd = root })
    else
        builtin.find_files({})
    end
end)

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

vim.keymap.set('n', '<leader>pg', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.grep_string({ search = vim.fn.input("grep > "), cwd = root })
    else
        builtin.grep_string({ search = vim.fn.input("grep > ") })
    end
end)


vim.keymap.set('n', '<leader>lg', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.live_grep({ cwd = root })
    else
        builtin.live_grep({})
    end
end)
