require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
-- map("n", "<S-b>", "")
map("n", "<S-L>",
  function()
    require("nvchad.tabufline.init").next()
  end,
  {
    desc = "goto next buffer",
  }
)
map("n", "<S-H>",
  function()
    require("nvchad.tabufline.init").prev()
  end,
  {
    desc = "goto prev buffer",
  }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
