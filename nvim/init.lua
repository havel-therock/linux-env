-- TODO @Kacper
-- * clean up mess in after.lua. Sepearate between different plugins?
-- * look for autoclosing brackets plugin
-- * add remap to easilly trigger clang-tidy --fix ? form nvim?

require "user.remap"
require "user.options"
require "user.autocmd"

require "_lazy"
require "user.after"
require "user.mess"


