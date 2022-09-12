local M = {
  ["BurntSushi/ripgrep"] = {},
  ["tpope/vim-surround"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["mattn/emmet-vim"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- ["jose-elias-alvarez/null-ls.nvim"] = {
  --     after = "nvim-lspconfig",
  --     config = function()
  --         require "custom.plugins.null-ls"
  --     end,
  -- }
}

return M
