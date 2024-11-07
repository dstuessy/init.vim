local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "ts_ls",
  "volar",
  "tailwindcss",
  "denols",
  "phpactor",
  "rust_analyzer",
  "arduino_language_server",
  "csharp_ls",
  "gopls",
  "cucumber_language_server",
}

for _, lsp in ipairs(servers) do
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
    autostart = true,
  }

  if lsp == "denols" then
    options.autostart = false
  end

  if lsp == "volar" then
    options.filetype = { "vue" }
    options.init_options = {
      vue = {
        hybridMode = false,
      },
      typescript = {
        tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
      },
    }
  end

  lspconfig[lsp].setup(options)
end
