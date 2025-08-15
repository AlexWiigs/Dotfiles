return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/notes/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/notes/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {

    note_id_func = function(title)
      return title
    end,

    ui = { enable = false },
    -- preferred_link_style = "markdown", -- wiki or markdown

    workspaces = {
      {
        name = "notes",
        path = "~/notes",
      },
    },
    daily_notes = {
      folder = "journal/daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },
    templates = {
      subdir = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      substitutions = {},
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },

    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
  },
  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Open today's daily note" })
  end,
}
