-- lua/plugins/leap.lua
return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  config = function()
    local leap = require("leap")

    -- custom mappings instead of add_default_mappings()
    vim.keymap.set({ "n", "x", "o" }, "f", function()
      leap.leap({})
    end, { desc = "Leap forward" })

    vim.keymap.set({ "n", "x", "o" }, "F", function()
      leap.leap({ backward = true })
    end, { desc = "Leap backward" })
  end,
}
