-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     -- Import lspconfig
--     local lspconfig = require("lspconfig")
--
--     -- Import capabilities from nvim-cmp
--     local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
--     -- Set up each LSP server with capabilities
--     lspconfig.pyright.setup({
--       capabilities = capabilities,
--     })
--
--     lspconfig.r_language_server.setup({
--       capabilities = capabilities,
--       filetypes = { "r", "quarto" },
--     })
--
--     lspconfig.texlab.setup({
--       capabilities = capabilities,
--       settings = {
--         texlab = {
--           build = {
--             executable = "latexmk",
--             args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
--             onSave = true,
--           },
--         },
--       },
--     })
--
--     -- Add other LSP servers as needed
--   end,
-- }


return {
    "neovim/nvim-lspconfig",
    config = function()
        -- Import lspconfig and cmp capabilities
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Centralized LSP capabilities for consistency
        local default_settings = {
            capabilities = capabilities,
        }

        -- Lua Language Server (lua_ls) setup
        lspconfig.lua_ls.setup(vim.tbl_extend("force", default_settings, {
            settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";"),
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }))

        -- Pyright for Python
        lspconfig.pyright.setup(vim.tbl_extend("force", default_settings, {}))

        -- TexLab for LaTeX
        lspconfig.texlab.setup(vim.tbl_extend("force", default_settings, {
            settings = {
                texlab = {
                    build = {
                        executable = "latexmk",
                        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
                        onSave = true,
                    },
                    forwardSearch = {
                        executable = "zathura",
                        args = { "--synctex-forward", "%l:1:%f", "%p" },
                    },
                    chktex = {
                        onOpenAndSave = true,
                        onEdit = false,
                    },
                },
            },
        }))

        -- Emmet Language Server for HTML and CSS
        lspconfig.emmet_ls.setup(vim.tbl_extend("force", default_settings, {
            filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        }))

        -- TailwindCSS Language Server
        lspconfig.tailwindcss.setup(vim.tbl_extend("force", default_settings, {}))

        -- CSS Language Server
        lspconfig.cssls.setup(vim.tbl_extend("force", default_settings, {}))

        -- TypeScript and JavaScript Language Server (using ts_ls)
        lspconfig.ts_ls.setup(vim.tbl_extend("force", default_settings, {}))

        -- JSON Language Server
        lspconfig.jsonls.setup(vim.tbl_extend("force", default_settings, {}))
    end,
}
