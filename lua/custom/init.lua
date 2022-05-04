local map = require("core.utils").map

map("n", "<leader>w", "<c-w>")
map('n', '<CR>', ':nohl<CR>')
map('n', 'vil', 'g_v^')
map("n", "<leader>t", ":Telescope <CR>")
map("n", "z=", ":Telescope spell_suggest <CR>")
map("n", "<leader>ls", ":Telescope lsp_document_symbols <CR>")
map("n", "<leader>f.", ":lua require('plugins.configs.telescope').find_configs() <CR>")
map("n", "<leader>f,", ":lua require('plugins.configs.telescope').search_configs() <CR>")
map('c', '<c-j>', '<c-n>')
map('c', '<c-k>', '<c-p>')
