return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
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

    -- NEW LSP API
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- lua_ls
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          completion  = { callSnippet = "Replace" },
          workspace   = {
            library = {
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.stdpath("config") .. "/lua",
            },
            checkThirdParty = false,
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- pyright
    vim.lsp.config("pyright", { capabilities = capabilities })
    vim.lsp.enable("pyright")

    -- R
    vim.lsp.config("r_language_server", { capabilities = capabilities })
    vim.lsp.enable("r_language_server")

    -- LaTeX
    vim.lsp.config("texlab", { capabilities = capabilities })
    vim.lsp.enable("texlab")

    -- Markdown
    vim.lsp.config("marksman", { capabilities = capabilities })
    vim.lsp.enable("marksman")

    -- MATLAB
    vim.lsp.config("matlab_ls", {
      cmd = {
        "node",
        vim.fn.expand("~/Documents/dev/MATLAB-language-server/out/index.js"),
        "--stdio",
      },
      capabilities = capabilities,
    })
    vim.lsp.enable("matlab_ls")

    -- Typst
    vim.lsp.config("tinymist", {
      capabilities = capabilities,
      single_file_support = true,
      settings = { exportPdf = "never" },
    })
    vim.lsp.enable("tinymist")
  end,
}
