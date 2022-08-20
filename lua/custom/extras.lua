local M = {}

local searchDirs = {
      "~/.oh-my-zsh/custom/",
      "~/.config/nvim",
      "~/.config/nvim/lua/custom",
      "~/.config/alacritty",
      "~/.config/yabai",
      "~/.config/scripts",
      "~/.config/lazygit",
      "~/.config/nixpkgs",
      "~/.config/my-snippets",
      "~/.zshrc",
      "~/.gitconfig",
      "~/.config/wezterm",
      "~/.skhdrc",
      "~/.tmux.conf",
      "~/dotFilesConfig.sh",
      "~/readme.md",
      "~/.bash_profile",
}

function M.find_configs()
  require("telescope.builtin").find_files {
    prompt_title = "Config Find",
    results_title = nil,
    path_display = { "truncate" },
    search_dirs = searchDirs,
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
    search_dirs = searchDirs,
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.6, width = 0.75, height = 0.5 },
  }
end

return M
