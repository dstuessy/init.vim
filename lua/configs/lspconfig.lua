-- load defaults i.e lua_lsp
-- require("nvchad.configs.lspconfig").defaults()
--
-- local lspconfig = require "lspconfig"
--
-- -- EXAMPLE
-- local servers = { "html", "cssls" }
-- local nvlsp = require "nvchad.configs.lspconfig"
--
-- -- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }


local configs = require "nvchad.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "clangd",
  "ts_ls",
  "volar",
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
