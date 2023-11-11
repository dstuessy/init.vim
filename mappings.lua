local M = {}

M.disabled = {
  n = {
    ["<S-b>"] = "",
  },
} -- disable some default mappings

M.tabufline = {
  n = {
    ["<S-L>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-H>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

return M
