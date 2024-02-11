local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "tsserver", "volar", "tailwindcss", "denols", "phpactor", "rust_analyzer",
  "arduino_language_server", "csharp_ls", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = lsp ~= "denols"
  }
end
