return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    "hrsh7th/cmp-nvim-lsp", -- LSP source for autocompletion
    "L3MON4D3/LuaSnip", -- snippets
    "saadparwaiz1/cmp_luasnip", -- for autocompletion with snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
    "williamboman/mason-lspconfig.nvim", -- Mason integration for easy LSP management
  },

  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/alex/LuaSnip" })
    local lspkind = require("lspkind")

    -- Setup LuaSnip (if you want to keep snippets for other purposes)
    luasnip.config.set_config({
      enable_autosnippets = true,
      store_selection_keys = "<tab>",
      update_events = "TextChanged, TextChangedI"
    })

    -- Setup cmp
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<D-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<D-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<D-b>"] = cmp.mapping.scroll_docs(-4),
        ["<D-f>"] = cmp.mapping.scroll_docs(4),
        ["<D-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<D-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm selection
      }),
       
      -- Global sources for autocompletion
      sources = cmp.config.sources({
        { name = "luasnip" },    -- Snippets first
        { name = "nvim_lsp" },   -- LSP for code completions
        { name = "path" },       -- File system paths
        { name = "latex_symbols" }, -- LaTeX symbols (if needed)
        { name = "nvim_lua" },   -- Lua completions for Neovim config (if relevant)
      }),

      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
    })
  end,
}

