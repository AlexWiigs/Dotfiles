return {
  "hrsh7th/nvim-cmp",
  version = false, -- track latest (fixes old client.request arg order)
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", version = false }, -- LSP source (latest)
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "nvim-treesitter/nvim-treesitter",
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local has_luasnip, luasnip = pcall(require, "luasnip")
    local lspkind = require("lspkind")

    -- ":" cmdline completion
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = "path" }, { name = "cmdline" } },
    })

    -- LuaSnip
    if has_luasnip then
      luasnip.config.set_config({ enable_autosnippets = true, store_selection_keys = "<Tab>" })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/dotfiles/nvim/lua/luasnip/" })
    end

    -- helpers
    local rhs = function(keys) return vim.api.nvim_replace_termcodes(keys, true, true, true) end
    local column = function() local _, c = unpack(vim.api.nvim_win_get_cursor(0)); return c end
    local in_snippet = function()
      if not has_luasnip then return false end
      local node = require("luasnip.session").current_nodes[vim.api.nvim_get_current_buf()]
      if not node then return false end
      local s = node.parent.snippet
      local b, e = s.mark:pos_begin_end()
      local pos = vim.api.nvim_win_get_cursor(0)
      return pos[1]-1 >= b[1] and pos[1]-1 <= e[1]
    end
    local in_leading_indent = function()
      local col = column(); local pre = vim.api.nvim_get_current_line():sub(1, col)
      return pre:find("^%s*$")
    end
    local in_whitespace = function()
      local col = column(); return col == 0 or vim.api.nvim_get_current_line():sub(col, col):match("%s")
    end
    local shift_width = function() return (vim.o.softtabstop <= 0) and vim.fn.shiftwidth() or vim.o.softtabstop end
    local smart_bs = function(dedent)
      local keys
      if vim.o.expandtab then
        keys = rhs(dedent and "<C-D>" or "<BS>")
      else
        local col = column()
        local pre = vim.api.nvim_get_current_line():sub(1, col)
        if in_leading_indent() then
          keys = rhs("<BS>")
        else
          local prev = pre:sub(#pre, #pre)
          keys = rhs(prev ~= " " and "<BS>" or "<C-\\><C-o>:set expandtab<CR><BS><C-\\><C-o>:set noexpandtab<CR>")
        end
      end
      vim.api.nvim_feedkeys(keys, "nt", true)
    end
    local smart_tab = function()
      local keys
      if vim.o.expandtab then
        keys = "<Tab>"
      else
        local col = column()
        local pre = vim.api.nvim_get_current_line():sub(1, col)
        if pre:find("^%s*$") then
          keys = "<Tab>"
        else
          local sw = shift_width()
          local prev = pre:sub(#pre, #pre)
          local prevcol = #pre - #prev + 1
          local curv = vim.fn.virtcol({ vim.fn.line("."), prevcol }) + 1
          local rem = (curv - 1) % sw
          keys = (" "):rep(rem == 0 and sw or sw - rem)
        end
      end
      vim.api.nvim_feedkeys(rhs(keys), "nt", true)
    end
    local select_next_item = function(fb) if cmp.visible() then cmp.select_next_item() else fb() end end
    local select_prev_item = function(fb) if cmp.visible() then cmp.select_prev_item() else fb() end end
    local confirm = function(entry)
      local behavior = cmp.ConfirmBehavior.Replace
      if entry then
        local ci = entry.completion_item
        local new = (ci.textEdit and ci.textEdit.newText) or (type(ci.insertText)=="string" and ci.insertText ~= "" and ci.insertText) or ci.word or ci.label or ""
        local diff_after = math.max(0, entry.replace_range["end"].character + 1) - entry.context.cursor.col
        if entry.context.cursor_after_line:sub(1, diff_after) ~= new:sub(-diff_after) then
          behavior = cmp.ConfirmBehavior.Insert
        end
      end
      cmp.confirm({ select = true, behavior = behavior })
    end

    local lsp_kinds = {
      Class=' ', Color=' ', Constant=' ', Constructor=' ', Enum=' ', EnumMember=' ',
      Event=' ', Field=' ', File=' ', Folder=' ', Function=' ', Interface=' ',
      Keyword=' ', Method=' ', Module=' ', Operator=' ', Property=' ',
      Reference=' ', Snippet=' ', Struct=' ', Text=' ', TypeParameter=' ',
      Unit=' ', Value=' ', Variable=' ',
    }

    cmp.setup({
      experimental = { ghost_text = false },
      completion = { completeopt = "menu,menuone,noinsert" },
      window = {
        documentation = { border = { '╭','─','╮','│','╯','─','╰','│' } },
        completion    = { border = { '┌','─','┐','│','┘','─','└','│' } },
      },
      snippet = {
        expand = function(args) if has_luasnip then luasnip.lsp_expand(args.body) end end,
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- restored LSP source
        { name = "luasnip" },
        { name = "lazydev" },
        { name = "buffer" },
        { name = "path" },
      }),
      mapping = cmp.mapping.preset.insert({
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-d>"] = cmp.mapping(function() cmp.close_docs() end, { "i","s" }),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping(select_next_item),
        ["<C-k>"] = cmp.mapping(select_prev_item),
        ["<C-n>"] = cmp.mapping(select_next_item),
        ["<C-p>"] = cmp.mapping(select_prev_item),
        ["<Down>"] = cmp.mapping(select_next_item),
        ["<Up>"]   = cmp.mapping(select_prev_item),
        ["<C-y>"] = cmp.mapping(function(fb) if cmp.visible() then confirm(cmp.get_selected_entry()) else fb() end end, { "i","s" }),
        ["<CR>"]  = cmp.mapping(function(fb) if cmp.visible() then confirm(cmp.get_selected_entry()) else fb() end end, { "i","s" }),
        ["<S-Tab>"] = cmp.mapping(function(fb)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif has_luasnip and in_snippet() and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          elseif in_leading_indent() then
            smart_bs(true)
          elseif in_whitespace() then
            smart_bs()
          else
            fb()
          end
        end, { "i","s" }),
        ["<Tab>"] = cmp.mapping(function(_)
          if cmp.visible() then
            local entries = cmp.get_entries()
            if #entries == 1 then confirm(entries[1]) else cmp.select_next_item() end
          elseif has_luasnip and luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif in_whitespace() then
            smart_tab()
          else
            cmp.complete()
          end
        end, { "i","s" }),
      }),
      formatting = {
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", lsp_kinds[vim_item.kind] or "", vim_item.kind)
          vim_item.menu = ({ buffer="[Buffer]", luasnip="[LuaSnip]", nvim_lua="[Lua]", path="[Path]", nvim_lsp="[LSP]" })[entry.source.name]
          return lspkind.cmp_format({ maxwidth = 25, ellipsis_char = "..." })(entry, vim_item)
        end,
      },
    })

    -- ghost text toggle
    local config = require("cmp.config")
    local toggle_ghost_text = function()
      if vim.api.nvim_get_mode().mode ~= "i" then return end
      local col = vim.fn.col(".")
      local line = vim.fn.getline(".")
      local ch = line:sub(col, col)
      local should = ch == "" or vim.fn.match(ch, [[\k]]) == -1
      local cur = config.get().experimental.ghost_text
      if cur ~= should then
        config.set_global({ experimental = { ghost_text = should } })
      end
    end
    vim.api.nvim_create_autocmd({ "InsertEnter", "CursorMovedI" }, { callback = toggle_ghost_text })
  end,
}
