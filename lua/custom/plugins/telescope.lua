local present, telescope = pcall(require, "telescope")
local actions = require('telescope.actions')

if not present then
   return
end

local options = {
   defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close,
            ["<C-n>"] = false,
            ["<C-p>"] = false,

            -- Otherwise, just set the mapping to the function that you want it to be.
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,

          },
          n = {
            ["<esc>"] = actions.close,
      },
    },
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },
      pickers = {
      oldfiles = {
        sort_lastused = true,
        theme = "ivy",
        layout_config = {
          height = 12,
        },
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

-- check for any override
options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
telescope.setup(options)


-- load extensions
local extensions = { "themes", "terms" }

pcall(function()
   for _, ext in ipairs(extensions) do
      telescope.load_extension(ext)
   end
end)

local M = {}

function M.find_configs()
  require("telescope.builtin").find_files {
    prompt_title = "Config Find",
    results_title = nil,
    path_display = { "smart" },
    search_dirs = {
      "~/.oh-my-zsh/custom/",
      "~/.config/nvim",
      "~/.config/alacritty",
      "~/.config/yabai",
      "~/.config/scripts",
      "~/.config/nixpkgs",
      "~/.config/my-snippets",
      "~/.zshrc",
      "~/.config/wezterm",
      "~/.skhdrc",
      "~/.tmux.conf",
      "~/dotFilesConfig.sh",
      "~/readme.md",
      "~/.bash_profile",
    },
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
  }
end

function M.search_configs()
  require("telescope.builtin").live_grep {
    prompt_title = "Config Search",
    results_title = nil,
    path_display = { "smart" },
    search_dirs = {
      "~/.oh-my-zsh/custom/",
      "~/.config/nvim",
      "~/.config/alacritty",
      "~/.config/yabai",
      "~/.config/wezterm",
      "~/.skhdrc",
      "~/.config/scripts",
      "~/.config/nixpkgs",
      "~/.config/my-snippets",
      "~/.zshrc",
      "~/.tmux.conf",
      "~/dotFilesConfig.sh",
      "~/readme.md",
      "~/.bash_profile",
    },
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
  }
end

return M

