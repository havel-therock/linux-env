-- TODO @Kacper
-- * clean up mess in after.lua. Sepearate between different plugins?
-- * add remap to easilly trigger clang-tidy --fix ? form nvim?

require "user.remap"
require "user.options"
require "user.autocmd"

require "_lazy"
--require "lsp"
require "user.remap_plugins"
require "user.after" -- to refactor it has to much responsibility
require "user.mess"


