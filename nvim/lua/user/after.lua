-- telescope after
--------------------------local result = os.execute()------------------------------------------------------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', function()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error == 0 then
        builtin.find_files({cwd = root})
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
        builtin.grep_string({ search = vim.fn.input("grep > ")})
    end
end)


-- lsp0
--------------------------------------------------------------------------------
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- Find the location based on the pip location
local function get_site_packages_path()
  local result = ""
  local cmd = "pip show pip | grep ^Location: | cut -d ' ' -f 2-"
  local virtualenv = os.getenv("VIRTUAL_ENV")
  if virtualenv then
    cmd = "source " .. virtualenv .."/bin/activate; " .. cmd
  end
  local handle = io.popen(cmd)
  if handle then
    result = handle:read("*a")
    handle:close()
    result = result:gsub("%s+$", "")
  end
  return result;
end


local util = require 'lspconfig.util'
local virtualenv2 = os.getenv("VIRTUAL_ENV")
if not virtualenv2 then
 virtualenv2 = ""
end
 virtualenv2 = virtualenv2 .. "/bin/python3"
vim.lsp.config['robotcode'] = {
  cmd = { 'robotcode', 'language-server' },
  filetypes = { 'robot', 'txt', 'resource' }, -- match this to your filetype
  root_dir = util.root_pattern('robot.toml', 'pyproject.toml', 'Pipfile', '.git'),
  single_file_support = true,
  get_language_id = function(_, _)
    return 'robotframework'
  end,
  settings = {
    robot = {
      python = virtualenv2, -- match the interpreter where SSHLibrary is installed
      pythonpath = get_site_packages_path(),
    }
  }
}


-- require("lspconfig").robotframework_ls.setup({
--   settings = {
--     robot = {
-- --      python = {
-- --        executable = "/path/to/your/venv/bin/python"
-- --      },
--       pythonpath = {
--         get_site_packages_path();
--       }
--     }
--   }
-- })


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


require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'clangd', 'cmake', 'lua_ls', 'pylsp', 'dockerls', 'bashls'},
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
