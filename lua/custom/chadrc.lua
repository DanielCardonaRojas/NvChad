local M = {}

M.ui = {
   theme = "catppuccin",
   theme_toggle = { "catppuccin", "onedark" },
}

local userPlugins = require "custom.plugins"

M.mappings = {
  disabled = {
    t = {
      ["<C-x>"] = "",
    }
  },
  nvimtree = {
     mode_opts = { silent = false }, -- this is completely optional
     n = {
        ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "?   toggle nvimtree" },
     },
  },
  lspconfig = {
    n = {
      ["<leader>ls"] = "",
      ["<leader>lm"] = {
        function ()
          vim.lsp.buf.formatting()
        end,
        "Format",
      },
      ["[e"] = {
         function()
            vim.diagnostic.goto_prev()
         end,
         "   goto prev",
      },
      ["]e"] = {
         function()
            vim.diagnostic.goto_next()
         end,
         "   goto_next",
      },
    }
  }
}

M.telescope = {
   n = {
      ["<leader>lS"] = { "<cmd> Telescope lsp_document_symbols<CR>", "Document symbols" },
   },
}

M.plugins = {
   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
   },
   user = userPlugins,
   remove = {
      "NvChad/nvterm",
      "max397574/better-escape.nvim",
   },
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
      },
   },

}

return M
