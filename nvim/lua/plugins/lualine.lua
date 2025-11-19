return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    -- components -------------------------------------------------------
    local mode = {
      "mode",
      separator = { left = "" },
      right_padding = 2,
    }

    local branch = { "branch", icon = { "" } }

    local diff = {
      "diff",
      colored = true,
      symbols = { added = " ", modified = " ", removed = " " },
    }

    local filename = {
      "filename",
      file_status = true,
      path = 0,
    }

    local lazy_updates = {
      lazy_status.updates,
      cond = lazy_status.has_updates,
      color = { fg = "#ff9e64" },
    }

    -- lualine setup ----------------------------------------------------
    lualine.setup({
      options = {
        theme = "auto", -- use colors from current colorscheme
        icons_enabled = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        -- globalstatus = true, -- uncomment if you like a single statusline
      },

      sections = {
        lualine_a = { mode },
        lualine_b = { branch },
        lualine_c = {
          "%=",       -- center
          diff,
          filename,
        },
        lualine_x = {
          lazy_updates,
          "filetype",
          "progress",
        },
        lualine_y = {},
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },

      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },

      tabline = {},
      extensions = {},
    })
  end,
}
