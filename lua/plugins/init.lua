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
    enabled = false,
    config = function()
      require("copilot").setup({
        -- disabling copilot for personal use
        filetypes = {
          ["*"] = false,
        },
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
  {
    "supermaven-inc/supermaven-nvim",
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<A-CR>",
          clear_suggestion = "<C-]>",
          accept_word = "<C-j>",
        },
      })
    end,
  }
}
