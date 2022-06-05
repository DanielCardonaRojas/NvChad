
local M = {

  ----------------- ADDITIONAL PLUGINS ---------------
    ["rcarriga/vim-ultest"] = {
      requires = {"vim-test/vim-test"},
      run = ":UpdateRemotePlugins",
      config = function()
       require('custom.plugins.ultest').configure()
      end,
    },

    ["folke/trouble.nvim"] = {
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          auto_open = false, -- automatically open the list when you have diagnostics
          auto_close = true, -- automatically close the list when you have no diagnostics
          mode = "workspace_diagnostics",
        }
      end,
      setup = function()
        vim.keymap.set("n", "<leader>ll", ":TroubleToggle <CR>", {})
      end
     },

    ["akinsho/toggleterm.nvim"] = {
      event = "VimEnter",
      config = function()
        require("toggleterm").setup{
          start_in_insert = true,
          shade_terminals = false,
        }
      end,
      setup = function()
         require("custom.mappings").toggleterm()
      end
    },

    ["beauwilliams/focus.nvim"] = {
      cmd = { 'FocusDisable'},
      config = function()
        require("focus").setup({
          excluded_filetypes = {'toggleterm', 'Trouble', 'NvimTree', 'dapui_scopes', 'dapui_breakpoints', 'dapui_stacks'},
          signcolumn = false
        })
      end,
      setup = function()
        vim.keymap.set("n", '<c-w>t', ':FocusMaxOrEqual <CR>')
      end
    },

    ["kwkarlwang/bufjump.nvim"] = {
      config = function()
          require("bufjump").setup({
              forward = "]f",
              backward = "[f",
              on_success = nil
          })
      end,
    },

    ['phaazon/hop.nvim'] = {
        as = 'hop',
        config = function()
          require('hop').setup { keys = 'etovxqpdygfblzhckisuran' }
        end,
        setup = function()
         require("custom.mappings").hop()
        end,
   },

    ['stevearc/dressing.nvim'] = {
        requires = {"MunifTanjim/nui.nvim"},
        config = function()
          require('dressing').setup({
            select = {
              backend = { "nui", "telescope", "fzf", "builtin", },
              nui = {
                position = "50%",
                size = nil,
                relative = "editor",
                border = {
                  style = "rounded",
                },
                max_width = 80,
                max_height = 40,
              },
            },
          })
        end
    },

   ['akinsho/flutter-tools.nvim'] = {
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require("flutter-tools").setup{
        debugger = { -- integrate with nvim dap + install dart code debugger
            enabled = true,
            run_via_dap = true,
            -- register_configurations = function(paths)
            --   require("dap").configurations.dart = {
            --     name = "Launch Flutter",
            --     request = "launch",
            --     type = "dart",
            --   }
            --
            --   require("dap.ext.vscode").load_launchjs()
            -- end,
        },
        lsp = {
          color = {
            virtual_text = false,
          },
          on_attach = function(client, bufnr)
            require('plugins.configs.lspconfig').on_attach(client, bufnr)
          end
        }
       }
     end,
     setup = function()
       vim.api.nvim_set_keymap('n', '<leader>r', ':FlutterReload <CR>', {})
       vim.api.nvim_set_keymap('n', '<leader>R', ':FlutterRestart <CR>', {})
     end
  },

   ['vim-test/vim-test'] = {},

   ["petertriho/nvim-scrollbar"] = {
     config = function()
      require("scrollbar").setup({
          excluded_filetypes = {
            'toggleterm',
            'Trouble',
            'NvimTree',
            'dapui_scopes',
            'dapui_breakpoints',
            'dapui_stacks',
            'prompt',
            'TelescopePrompt',
          },
      })
     end,
   },

  ['mfussenegger/nvim-dap'] = {
    config = function()
       require('custom.plugins.dap').configure()
    end,
    setup = function()
       require("custom.mappings").dap()
    end
  },

  ["rcarriga/nvim-dap-ui"] = {
    requires = {"mfussenegger/nvim-dap"},
    config = function()
      require('dapui').setup({
        sidebar = {
          size = 60,
        }
      })

      local dap = require('dap')

      dap.listeners.before['event_stopped']['rcarriga/nvim-dap-ui'] = function(session, body)
        print('Stopped at breakpoint')
        require("dapui").open()
      end

      dap.listeners.before['event_terminated']['rcarriga/nvim-dap-ui'] = function(session, body)
        require("dapui").close()
      end

    end,
    setup = function()
       require("custom.mappings").dapui()
    end,
  },


  ----------------- ENABLE PLUGINS ---------------

  ["goolord/alpha-nvim"] = {
     disable = false,
  },

  ----------------- OVERRIDES ---------------

  ["feline-nvim/feline.nvim"] = {
     after = "nvim-web-devicons",
     config = function()
        require "custom.plugins.statusline"
     end,
  },

}

return M
