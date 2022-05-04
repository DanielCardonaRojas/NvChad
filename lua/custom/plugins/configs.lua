local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "dart",
      "swift",
      "rust",
      "go",
   },
}

M.nvimtree = {
   git = {
      enable = true,
   },
   view = {
      side = "right",
      width = 40,
      auto_resize  = true,
      allow_resize = true,
   },
}

return M
