return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    ft = { "python", "markdown", "quarto" },

    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
    end,

    config = function()
      -- your keymaps go here
      vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", {
        silent = true, desc = "Initialize Molten"
      })

      vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", {
        silent = true, desc = "Evaluate operator"
      })

      vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", {
        silent = true, desc = "Evaluate line"
      })

      vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", {
        silent = true, desc = "Re-evaluate cell"
      })

      vim.keymap.set("v", "<leader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "Evaluate visual selection" }
      )
    end,
  },

  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = { enabled = false },
        neorg    = { enabled = false },
        typst    = { enabled = false },
      },
      max_width  = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage  = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
}
