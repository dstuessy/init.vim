local M = {
  ["BurntSushi/ripgrep"] = {},
  ["tpope/vim-surround"] = {},
  ["editorconfig/editorconfig-vim"] = {},
  ["mattn/emmet-vim"] = {},
  ["matze/vim-move"] = {},
  ["neovim/nvim-lspconfig"] = {
    dependencies = {
      ["jose-elias-alvarez/null-ls.nvim"] = {
        config = function()
          require "custom.configs.null-ls"
        end,
      }
    },
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
  ["zbirenbaum/copilot.lua"] = {
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
  ["zbirenbaum/copilot-cmp"] = {
    required = { "zbirenbaum/copilot.lua" },
    config = function ()
      print("copilot-cmp config")
      require("copilot_cmp").setup()
    end
  },
}

return M
