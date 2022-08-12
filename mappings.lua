local M = {}

M.disabled = {
  n = {
    ["<S-b>"] = ""
  }
}

M.tabufline = {
  n = {
    ["<S-L>"] = {
      function()
        require("core.utils").tabuflineNext()
      end,
      "goto next buffer",
    },

    ["<S-H>"] = {
      function()
        require("core.utils").tabuflinePrev()
      end,
      "goto prev buffer",
    },
  }
}

return M
