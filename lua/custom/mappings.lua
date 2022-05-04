local map = require("core.utils").map

local M = {}
M.toggleterm = function()
  map('n', "<leader>gg", "<cmd>lua require('custom.plugins.toggleterm').lzg()<CR>")
  map('n', "<leader>gG", "<cmd>lua require('custom.plugins.toggleterm').lzgc()<CR>")
  map('n', "<c-x>", "<cmd>lua require('custom.plugins.toggleterm').devterm()<CR>")
  map('t', "<c-x>", [[ <c-\><c-n><cmd>lua require('custom.plugins.toggleterm').devterm()<CR> ]])
  map('n', "<c-_>", "<cmd>lua require('custom.toggleterm').devterm()<CR>")
  map('t', "<c-_>", [[ <c-\><c-n><cmd>lua require('custom.plugins.toggleterm').devterm()<CR> ]])
end

M.hop = function()
  local hop_trigger = "<leader><leader>"
  map("n", hop_trigger .. "w" , ":HopWordAC <CR>")
  map("n", hop_trigger .. "b" , ":HopWordBC <CR>")
  map("n", hop_trigger .. "f" , ":HopChar1AC <CR>")
  map("n", hop_trigger .. "F" , ":HopChar1BC <CR>")
  map("n", hop_trigger .. "j" , ":HopLineAC <CR>")
  map("n", hop_trigger .. "k" , ":HopLineBC <CR>")
end

M.dap = function()
  map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint() <CR>')
  map("n", "<F5>", ':lua require"dap".continue() <CR>')
  map("n", "<leader>dc", ':lua require"dap".continue() <CR>')
  map("n", "<leader>dj", ':lua require"dap".step_over() <CR>')
  map('n', '<leader>dr', ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
  map('n', '<leader>de', ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
  map('n', '<leader>da', ':lua require"debugHelper".attach()<CR>')
  map('n', '<leader>dA', ':lua require"debugHelper".attachToRemote()<CR>')
  map('n', '<leader>di', ':lua require"dap.ui.widgets".hover()<CR>', {})
end

M.dapui = function()
  map('n', '<leader>dd', ':lua require("dapui").toggle() <CR>')
  map('n', '<leader>dD', ':lua require("dapui").float_element("scopes") <CR>')
  map('n', '<leader>dS', ':lua require("dapui").float_element("stacks") <CR>')
  map('n', '<leader>dB', ':lua require("dapui").float_element("breakpoints") <CR>')
end

return M
