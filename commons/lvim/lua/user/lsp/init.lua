lvim.lsp.installer.setup.automatic_installation.exclude = { "sumneko_lua", "nix", "eslint_d", "prettier" }

lvim.lsp.diagnostics.signs.values = {
  { name = "DiagnosticSignError", text = lvim.icons.diagnostics.BoldError },
  { name = "DiagnosticSignWarn", text = lvim.icons.diagnostics.BoldWarning },
  { name = "DiagnosticSignHint", text = lvim.icons.diagnostics.BoldHint },
  { name = "DiagnosticSignInfo", text = lvim.icons.diagnostics.BoldInformation },
}

require("lvim.lsp.manager").setup("lua_ls", {})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lvim.lsp.manager").setup("emmet_ls", {
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  { command = "stylua", filetypes = { "lua" } },
  { command = "shfmt", filetype = { "sh" } },
  {
    command = "prettier",
    extra_args = { "--print-with", "100" },
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "svelte",
      "astro",
    },
  },
}

-- lvim.lsp.float.border = "none"
-- lvim.lsp.diagnostics.float.border = "none"


