-- telescope after
--------------------------------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>pg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


-- lsp0
--------------------------------------------------------------------------------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'cmake', 'lua_ls', 'pylsp', 'dockerls', 'bashls' },
    handlers = {
        lsp_zero.default_setup,
        clangd = function()
            require('lspconfig').clangd.setup({
                -- in here you can add your own
                -- custom configuration
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
            })
        end,
        -- bufls = function()
         --   require('lspconfig
    },
})




-- lsp server that comes embedded with dart
require 'lspconfig'.dartls.setup {
    cmd = { "dart", 'language-server', '--protocol=lsp' },
}

-- PLS lsp for protocol buffers
-- first we need to configure our custom server
local configs = require('lspconfig.configs')
local util = require('lspconfig.util')

configs.pls = {
    default_config = {
        cmd = { 'pls' },
        filetypes = { 'proto', 'cpp' },
        root_fir = util.root_pattern('.git'),
        single_file_support = true,
        settings = {},
    }
}
---
-- then we can continue as we do with official servers
local lspconfig = require('lspconfig')
lspconfig.pls.setup {}



---
-- Autocompletion config
---
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+b to trigger completion menu
        ['<C-b>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    })
})
