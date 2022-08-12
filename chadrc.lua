local M = {}

vim.opt.relativenumber = true

M.plugins = {
  user = require "custom.plugins"
}

M.mappings = require "custom.mappings"

return M
