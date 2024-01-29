return {
--------------------------------------------------------------------------------
"rebelot/kanagawa.nvim",
config = function()
-- Default options:
require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
end

--------------------------------------------------------------------------------
--    "bluz71/vim-nightfly-colors",
--    config = function()
--        vim.g.nightflyTransparent = true
--        vim.cmd([[colorscheme nightfly]])
--    end,

--------------------------------------------------------------------------------
--    'rose-pine/neovim',
--    name = 'rose-pine',
--    lazy = false,
--    priority = 1000,
--    config = function()
--        require('rose-pine').setup({
--            variant = "auto", -- auto, main, moon, or dawn
--            dark_variant = "main", -- main, moon, or dawn
--            dim_inactive_windows = false,
--            extend_background_behind_borders = true,
--            styles = {
--                bold = false,
--                italic = false,
--                transparency = true,
--            },
--        })
--        vim.cmd.colorscheme("rose-pine")
--    end,
--
--------------------------------------------------------------------------------
    -- you need lsp set up for this to work :)
--    'folke/lsp-colors.nvim',
--    config = function()
--        require("lsp-colors").setup({
--            Error = "#db4b4b",
--            Warning = "#e0af68",
--            Information = "#0db9d7",
--            Hint = "#10B981"
--        })
--    end,
--------------------------------------------------------------------------------
}
