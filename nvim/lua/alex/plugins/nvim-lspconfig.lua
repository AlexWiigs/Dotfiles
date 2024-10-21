return {
  "neovim/nvim-lspconfig",
  config = function()
    -- Import lspconfig
    local lspconfig = require("lspconfig")

    -- Import capabilities from nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Set up each LSP server with capabilities
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    lspconfig.r_language_server.setup({
      capabilities = capabilities,
      filetypes = { "r", "quarto" },
    })

    lspconfig.texlab.setup({
      capabilities = capabilities,
      settings = {
        texlab = {
          build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            onSave = true,
          },
        },
      },
    })

    -- Add other LSP servers as needed
  end,
}
