-- lsp0
--------------------------------------------------------------------------------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- this will hit all LSPs
vim.lsp.inlay_hint.enable(true)

-- lsp server that comes embedded with dart
vim.lsp.config['dartls'] = {
    cmd = { "dart", 'language-server', '--protocol=lsp' },
}

-- -- PLS lsp for protocol buffers
-- -- first we need to configure our custom server
-- local configs = require('lspconfig.configs')
-- local util = require('lspconfig.util')
--
-- configs.pls = {
--     default_config = {
--         cmd = { 'pls' },
--         filetypes = { 'proto', 'cpp' },
--         root_fir = util.root_pattern('.git'),
--         single_file_support = true,
--         settings = {},
--     }
-- }
-- ---
-- -- then we can continue as we do with official servers
-- local lspconfig = require('lspconfig')
-- lspconfig.pls.setup {}

---@brief
---
--- https://robotcode.io
---
--- RobotCode - Language Server Protocol implementation for Robot Framework.

---@type vim.lsp.Config
vim.lsp.config['robotcode'] = {
    cmd = { 'robotcode', 'language-server' },
    cmd_env = (function()
        local venv = os.getenv("VIRTUAL_ENV")
        if not venv then
            return nil
        end
        local site = vim.fn.glob(venv .. "/lib/python*/site-packages")
        return { PYTHONPATH = site }
    end)(),
    filetypes = { "robot", "resource", "text" },
    root_markers = { 'robot.toml', 'pyproject.toml', 'Pipfile', '.git' },
    get_language_id = function(_, _)
        return 'robotframework'
    end,
}

vim.lsp.enable('robotcode')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'cmake', 'lua_ls', 'pylsp', 'dockerls', 'bashls' },
    handlers = {
        lsp_zero.default_setup,
        clangd = function()
            vim.lsp.config['clangd'] = {
                -- in here you can add your own
                -- custom configuration
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "h", "hpp" },
            }
        end,
        -- bufls = function()
        --   require('lspconfig
    },
})

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


-- set GitBlame to be off by default
require('gitblame')
