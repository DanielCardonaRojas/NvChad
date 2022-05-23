local map = require("custom.utils").map
local opt = vim.opt

-------------------------------  CUSTOM OPTIONS ---------------------------
opt.updatetime = 1000
opt.swapfile = false

-------------------------------  CUSTOM MAPPINGS ---------------------------
map("n", "<leader>w", "<c-w>")
map('n', '<CR>', ':nohl<CR>')
map('n', 'vil', 'g_v^')
map("n", "<leader>f.", ":lua require('custom.plugins.telescope').find_configs() <CR>")
map("n", "<leader>f,", ":lua require('custom.plugins.telescope').search_configs() <CR>")
map('c', '<c-j>', '<c-n>')
map('c', '<c-k>', '<c-p>')
map('n', '<CR>', ':nohl<CR>')
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")

-- Terminal
map("t", "<c-k>", "<C-\\><C-n><C-w>k")
map("t", "<c-j>", "<C-\\><C-n><C-w>j")
map("t", "<c-l>", "<C-\\><C-n><C-w>l")
map("t", "<c-h>", "<C-\\><C-n><C-w>h")

-------------------------------  CUSTOM AUTOCOMMANDS ---------------------------
vim.cmd [[ autocmd BufEnter *.dart :lua vim.api.nvim_buf_set_option(0, "commentstring", "// %s") ]]
vim.cmd [[ autocmd BufEnter NvimTree :NvimTreeRefresh ]]
vim.cmd [[ autocmd CursorHold * :lua vim.diagnostic.open_float() ]]
vim.cmd [[ autocmd BufWritePre *.dart lua vim.lsp.buf.formatting() ]]
-- vim.cmd [[ autocmd BufEnter,FileType *.dart set colorcolumn=81]]
-- vim.cmd [[ autocmd UIEnter * :hi Normal guibg=NONE ctermbg=NONE ]]
vim.cmd [[ autocmd BufEnter log :set nonumber nowrap ]]

-------------------------------  CUSTOM OPTIONS ---------------------------
