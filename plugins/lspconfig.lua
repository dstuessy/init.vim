local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local servers = { "html", "cssls", "clangd", "tsserver", "volar", "tailwindcss", "denols", "phpactor", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  configs[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
