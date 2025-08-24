return {
  -- 1) Hard-disable cmp-nvim-lsp so it cannot load
  { "hrsh7th/cmp-nvim-lsp", enabled = true },


  -- 2) LSP servers (adds tinymist for Typst)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      -- on-attach keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local k = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
          end
          k("n", "gR", "<cmd>Telescope lsp_references<CR>", "LSP references")
          k("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
          k("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "LSP definition")
          k("n", "gi", "<cmd>Telescope lsp_implementations<CR>", "LSP implementations")
          k("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "LSP type def")
          k({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, "Code action")
          k("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          k("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Buffer diags")
          k("n", "<leader>d", vim.diagnostic.open_float, "Line diag float")
          k("n", "K", vim.lsp.buf.hover, "Hover")
          k("n", "<leader>rs", ":LspRestart<CR>", "LSP restart")
          k("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
        end,
      })

      -- diagnostics
      local signs = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN]  = " ",
        [vim.diagnostic.severity.HINT]  = "󰠠 ",
        [vim.diagnostic.severity.INFO]  = " ",
      }
      vim.diagnostic.config({
        signs = { text = signs },
        virtual_text = true,
        underline = true,
        update_in_insert = false,
      })

      -- base capabilities (no cmp-nvim-lsp)
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")

      -- Lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion  = { callSnippet = "Replace" },
            workspace   = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })

      -- Python / R / Markdown / TeX / MATLAB
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.r_language_server.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities })
      lspconfig.texlab.setup({ capabilities = capabilities })
      lspconfig.matlab_ls.setup({
        cmd = { "node", vim.fn.expand("~/Documents/dev/MATLAB-language-server/out/index.js"), "--stdio" },
        capabilities = capabilities,
      })

      -- Typst (Tinymist)
      -- Install: `brew install tinymist` or `cargo install tinymist`
      lspconfig.tinymist.setup({
        capabilities = capabilities,
        single_file_support = true,
        root_dir = function(fname)
          return util.root_pattern("typst.toml", ".git")(fname) or vim.fn.getcwd()
        end,
        settings = {
          exportPdf = "onSave",   -- "onType" | "onSave" | "never"
          formatterMode = "typstyle",
          -- typstExtraArgs = { }, -- e.g., { "-f", "json" }
        },
      })
    end,
  },
}
