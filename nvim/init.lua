local vim = vim
local api = vim.api


-- Behaviour
------------------------------------------------------------------------ 
-- TODO: @Kacper
-- * strip trailing whitespaces function
-- * trigger stripping function on write

-- Appearance
------------------------------------------------------------------------ 
-- relative line numbers
vim.wo.relativenumber = true
-- absolute line number on the cursor line
vim.wo.number = true
-- show a bar on column 80 and 120
vim.wo.colorcolumn = "80,120"
-- set color of colorcolumns
vim.highlight.create('ColorColumn', {ctermbg=0, guibg=darkgrey}, false)
-- tab eq 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.smarttab = true
-- soft ignore case in searches
vim.o.ignorecase = true
vim.o.smartcase = true
