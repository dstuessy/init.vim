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
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-H>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

return M
