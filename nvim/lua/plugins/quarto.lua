return {
  "quarto-dev/quarto-nvim",
  dependencies = {
    "jmbuhr/otter.nvim",      -- lets LSPs attach to code blocks
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("quarto").setup({
      lspFeatures = {
        languages = { "python", "r", "lua", "bash", "matlab=octave" },
        chunks = "all",
        diagnostics = {
          enabled = true,
          triggers = { "BufWritePost" },
        },
        completion = { enabled = true },
      },
    })
  end,
}
