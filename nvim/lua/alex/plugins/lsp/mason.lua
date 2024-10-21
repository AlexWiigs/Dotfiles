return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

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

    mason_lspconfig.setup({
      -- list of servers for mason to install
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
    
    -- import lspconfig for LSP server configurations
    local lspconfig = require("lspconfig")

    -- Set up texlab for LaTeX
    lspconfig.texlab.setup({
      settings = {
        texlab = {
          auxDirectory = ".",
          bibtexFormatter = "texlab",
          build = {
            executable = "latexmk",
            args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
            onSave = true, -- Build on save
          },
          forwardSearch = {
            executable = "skim", -- Example: replace with your PDF viewer
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
      settings = {
        ltex = {
          language = "en", -- Set your preferred language
        },
      },
    })

    -- Additional LSP configurations can go here for other servers like pyright, lua_ls, etc.
    -- Example: Pyright for Python
    lspconfig.pyright.setup({})
    
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    lspconfig.r_language_server.setup {
      capabilities = capabilities,
      filetypes = { "r", "quarto" }, -- Ensure it works with Quarto files
    }

  end,
}
