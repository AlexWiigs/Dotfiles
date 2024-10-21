return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason and mason-lspconfig
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- configure mason-lspconfig
    mason_lspconfig.setup({
      ensure_installed = {
        "texlab",
        "ltex",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "r_language_server",
      },
    })
    
    -- Set up texlab for LaTeX
    lspconfig.texlab.setup({
      capabilities = capabilities,
      settings = {
        texlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            onSave = true,
          },
          forwardSearch = {
            executable = "skim", -- Update with the correct path if necessary
            args = { "--synctex-forward", "%l:1:%f", "%p" },
          },
          chktex = {
            onOpenAndSave = true,
            onEdit = true,
          },
        },
      },
    })

    -- Set up ltex-ls for grammar and spell checking
    lspconfig.ltex.setup({
      capabilities = capabilities,
      settings = {
        ltex = {
          language = "en",
        },
      },
    })

    -- Set up pyright for Python
    lspconfig.pyright.setup({
      capabilities = capabilities,
    })

    -- Set up r_language_server for R and Quarto files
    lspconfig.r_language_server.setup({
      capabilities = capabilities,
      filetypes = { "r", "quarto" }, -- Ensure it works with Quarto files
    })
  end,
}
