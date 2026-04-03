require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.abbreviations")
require("config.lazy")

if vim.g.neovide then  -- only in a Neovide session
  -- Ensure the default directory is the home directory
  vim.cmd [[
  autocmd VimEnter * if match(getcwd(), '^' . expand('~')) == -1 | cd ~ | endif
  ]]
end
local orig = vim.notify
vim.notify = function(...)
  vim.notify = orig  -- restore immediately
  error(debug.traceback("vim.notify overwritten here", 2))
end
