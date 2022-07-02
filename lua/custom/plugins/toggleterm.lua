local M = {}

local Terminal  = require('toggleterm.terminal').Terminal

onOpen = function(term)
    vim.cmd("startinsert!")
    -- vim.api.nvim_buf_del_keymap(term.bufnr, 't', '<Esc>')
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
end

local homeDir = os.getenv('HOME')

local devterm = Terminal:new({
  count = 2,
  direction = "horizontal",
  persist_size = false,
  size = 25,
})

local lazygit = Terminal:new({
  cmd = "lazygit",
  count = 3,
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = onOpen,
})


local dotfiles = Terminal:new({
  count = 4,
  cmd = 'lazygit --git-dir='..homeDir..'/.cfg --work-tree='..homeDir,
  dir = "git_dir",
  direction = "float",
  float_opts = {
    border = "double",
  },
  on_open = onOpen,
})


M.lzgc = function()
  dotfiles:toggle()
end

M.lzg = function()
  lazygit:toggle()
end

M.devterm = function()
  devterm:toggle()
end

return M
