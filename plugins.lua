---@type NvPluginSpec[]
local plugins = {
  {"BurntSushi/ripgrep"},
  {"tpope/vim-surround", lazy = false},
  {"editorconfig/editorconfig-vim"},
  {
    "mattn/emmet-vim",
    ft = {"vue", "ts", "jsx", "tsx", "html"}
  },
  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },
  {"neovim/nvim-lspconfig",
    requires = { "jose-elias-alvarez/null-ls.nvim"
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {"MunifTanjim/nui.nvim",
    opts = {
      module = {"nui.layout", "nui.popup"},
      module_pattern = {"nui.*"}
    }
  },
  {"jackMort/ChatGPT.nvim",
    opt = true,
    keys = {"<leader>gpt"},
    module_pattern = {"chatgpt*"},
    -- after = {"nui.nvim", "telescope.nvim"},
    config = function()
      require("custom.configs.chat-gpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
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

return plugins
