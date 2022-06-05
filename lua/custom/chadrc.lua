local M = {}

M.ui = {
   transparency = false,
   theme = "catppuccin",
   theme_toggle = { "catppuccin", "onedark" },
}

local userPlugins = require "custom.plugins"

-------------------------- MAPPINGS --------------------------
M.mappings = {
  disabled = {
    t = {
      ["<C-x>"] = "",
    }
  },
  nvimtree = {
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
  },
  telescope = {
     n = {
        -- find
        ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "  find files" },
        ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "  find all" },
        ["<leader>fs"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
        ["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
        ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "  help page" },
        ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "   find oldfiles" },
        ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "   show keys" },
        -- lsp
        ["<leader>ls"] = { "<cmd> Telescope lsp_document_symbols <CR>", "  document symbols" },

        -- git
        ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "   git commits" },
        ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "  git status" },

        -- pick a hidden term
        ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "   pick hidden term" },

        -- theme switcher
        ["<leader>th"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
     },
  }
}


-------------------------- PLUGINS --------------------------
M.plugins = {
   user = userPlugins,
   remove = {
      "NvChad/nvterm",
      "max397574/better-escape.nvim",
   },
   override = {
      ["wbthomason/packer.nvim"] = {
        -- snapshot = "stable_chad",
        snapshot_path = vim.fn.expand "$HOME" .. "/.config/nvim",
      },
      ["nvim-treesitter/nvim-treesitter"] = {
          ensure_installed = {
            "dart",
            "swift",
            "bash",
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
            auto_resize = true,
         },
      },
      ["akinsho/bufferline.nvim"] = {
         options = {
            max_name_length = 25,
            max_prefix_length = 25,
            tab_size = 30,
         },
      },
      ["lewis6991/gitsigns.nvim"] = {
         current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
         current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
         },
      },
      ["hrsh7th/nvim-cmp"] = {
        mappings = {
          ["<C-k>"] = function()
            require('cmp').mapping.select_prev_item()
          end,
          ["<C-j>"] = function()
            require('cmp').mapping.select_next_item()
          end,
        }
      },
      ["nvim-telescope/telescope.nvim"] = {
         defaults = {
            mappings = {
               n = { ["q"] = require("telescope.actions").close },
               i = {
                  ["<esc>"] = require("telescope.actions").close,
                  ["<C-n>"] = false,
                  ["<C-p>"] = false,

                  -- Otherwise, just set the mapping to the function that you want it to be.
                  ["<C-j>"] = require("telescope.actions").move_selection_next,
                  ["<C-k>"] = require("telescope.actions").move_selection_previous,
               },
            },
         },
         pickers = {
               oldfiles = {
               sort_lastused = true,
               theme = "ivy",
               layout_config = {
                  height = 12,
               },
               previewer = false,
               },
               lsp_document_symbols = {
               previewer = false,
               symbols = {"method", "class"},
               layout_config = {
                  height = 20,
                  width = 0.4,
               },
               },
               buffers = {
               path_display = { "smart" },
               sort_lastused = true,
               ignore_current_buffer = true,
               theme = "dropdown",
               layout_config = {
                  height = 12,
               },
               previewer = false,
               mappings = {
                  i = {
                     ["<c-d>"] = require("telescope.actions").delete_buffer,
                  },
                  n = {
                     ["<c-d>"] = require("telescope.actions").delete_buffer,
                  }
               }
               },
               find_files = {
               path_display = { "smart" },
               theme = "dropdown",
               previewer = false,
               },
               lsp_references = { theme = 'dropdown' },
               lsp_definitions = { theme = 'dropdown' },
               lsp_implementations = { theme = 'dropdown' },
               lsp_code_actions = { theme = 'dropdown' }
         },
      }
   },

}


return M
