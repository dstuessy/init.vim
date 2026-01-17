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
  "lua_lsp",
  "html",
  "cssls",
  "clangd",
  "ts_ls",
  "volar",
  "denols",
  "phpactor",
  "rust_analyzer",
  "arduino_language_server",
  "omnisharp",
  "gopls",
  "cucumber_language_server",
  "emmet_language_server",
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

  if lsp == "omnisharp" then
    -- options.cmd = {
    --   "/home/danielstuessy/.local/share/nvim/mason/packages/omnisharp/OmniSharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid())
    -- }
    -- options.cmd = { omnisharp_path, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) }
    -- options.root_dir = require('lspconfig').util.root_pattern("*.csproj", "*.sln")
  end

  if lsp == "emmet_language_server" then
    options.filetype = {
      "astro",
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "php",
      "pug",
      "sass",
      "scss",
      "vue",
      "typescriptreact",
    }
    -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
    -- **Note:** only the options listed in the table are supported.
    options.init_options = {
      --- @type string[]
      excludeLanguages = {},
      --- @type string[]
      extensionsPath = {},
      --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
      preferences = {},
      --- @type boolean Defaults to `true`
      showAbbreviationSuggestions = true,
      --- @type "always" | "never" Defaults to `"always"`
      showExpandedAbbreviation = "always",
      --- @type boolean Defaults to `false`
      showSuggestionsAsSnippets = false,
      --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
      syntaxProfiles = {},
      --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
      variables = {},
    }
  end

  -- lspconfig[lsp].setup(options)
  vim.lsp.config(lsp, options)
  vim.lsp.enable(lsp)
end
