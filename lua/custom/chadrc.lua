-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.ui = {
   theme = "catppuccin",
}

local userPlugins = require "custom.plugins"

M.plugins = {
   user = userPlugins,
   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
          ensure_installed = {
            "dart",
            "swift",
            "rust",
            "go",
         },
      },

      ["kyazdani42/nvim-tree.lua"] = {
         git = {
            enable = true,
         },
         view = {
            side = "left",
            width = 40,
            auto_resize  = true,
            allow_resize = true,
         },
      },

      ["akinsho/bufferline.nvim"] = {
         options = {
            max_name_length = 25,
            max_prefix_length = 25,
            tab_size = 30,
         },
      }
   },

}

return M
