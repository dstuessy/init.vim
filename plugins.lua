local M = {
  ["BurntSushi/ripgrep"] = {},
  ["tpope/vim-surround"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["mattn/emmet-vim"] = {},
  ["matze/vim-move"] = {},
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["MunifTanjim/nui.nvim"] = {
    module = {"nui.layout", "nui.popup"},
    module_pattern = {"nui.*"}
  },
  ["jackMort/ChatGPT.nvim"] = {
    opt = true,
    keys = {"<leader>gpt"},
    module_pattern = {"chatgpt*"},
    after = {"nui.nvim", "telescope.nvim"},
    setup = function()
      require("custom.plugins.configs.chat-gpt").load_api_key()
    end,
    config = function()
      require("custom.plugins.configs.chat-gpt").setup()
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
}

return M
