local M = {}

local nvchad = require('core.utils')

M.configure = function()
  local present, gitsigns = pcall(require, "gitsigns")

  if not present then
    return
  end

  local options = {
      keymaps = {
          buffer = true,
          noremap = true,
          ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'" },
          ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'" },
          ["n <leader>gs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
          ["n <leader>gu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
          ["n <leader>gr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
          ["n <leader>gp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      },
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
      },
      signs = {
          add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
          change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
          delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
          topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
          changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
      },
  }

  options = nvchad.load_override(options, "lewis6991/gitsigns.nvim")
  gitsigns.setup(options)
end

return M
