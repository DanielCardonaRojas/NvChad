local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "clangd" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = function(client, bufnr)
            attach(client, bufnr)
            if lsp == "dartls" then
               client.resolved_capabilities.document_formatting = true
            end

            if lsp == "sumneko_lua" then
               client.resolved_capabilities.document_formatting = true
            end
         end,
         capabilities = capabilities,
      }
   end
end

return M
