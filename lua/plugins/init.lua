return {
  {"tpope/vim-surround", lazy = false},
  {"BurntSushi/ripgrep"}, -- required  for regexp search in telescope
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {"zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          -- enabled = false
          auto_trigger = true,
          keymap = {
            accept = "<A-CR>",
            accept_word = false,
            accept_line = false,
            next = "<A-Tab>",
            prev = "<A-S-Tab>",
            dismiss = "<A-[>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
  {"zbirenbaum/copilot-cmp",
    required = { "zbirenbaum/copilot.lua" },
    config = function ()
      print("copilot-cmp config")
      require("copilot_cmp").setup()
    end
  },
}
