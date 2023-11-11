local M = {}

vim.opt.relativenumber = true

-- M.plugins = {
--   user = require "custom.plugins"
-- }

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
