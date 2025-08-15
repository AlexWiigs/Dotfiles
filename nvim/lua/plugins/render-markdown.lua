return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("render-markdown").setup({
      heading = {
        sign = false,
        icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
        backgrounds = {
          "Headline1Bg",
          "Headline2Bg",
          "Headline3Bg",
          "Headline4Bg",
          "Headline5Bg",
          "Headline6Bg",
        },
        foregrounds = {
          "Headline1Fg",
          "Headline2Fg",
          "Headline3Fg",
          "Headline4Fg",
          "Headline5Fg",
          "Headline6Fg",
        },
      },

      latex = {
        enabled = true,
        render_modes = false,
        converter = "latex2text",
        highlight = "RenderMarkdownMath",
        position = "above",
        top_pad = 0,
        bottom_pad = 0,
      },

      code = {
        sign = false,
        width = "block",
        right_pad = 1,
      },

      bullet = {
        enabled = true,
      },

      -- My link additions to default config
      link = {
        -- Turn on / off inline link icon rendering.
        enabled = true,
        -- Additional modes to render links.
        render_modes = false,
        -- How to handle footnote links, start with a '^'.
        footnote = {
          -- Turn on / off footnote rendering.
          enabled = true,
          -- Replace value with superscript equivalent.
          superscript = true,
          -- Added before link content.
          prefix = '',
          -- Added after link content.
          suffix = '',
        },
        -- Inlined with 'image' elements.
        image = '󰥶 ',
        -- Inlined with 'email_autolink' elements.
        email = '󰀓 ',
        -- Fallback icon for 'inline_link' and 'uri_autolink' elements.
        hyperlink = '󰌹 ',
        -- Applies to the inlined icon as a fallback.
        highlight = 'RenderMarkdownLink',
        -- Applies to WikiLink elements.
        wiki = {
          icon = '',
          body = function()
            return nil
          end,
          highlight = 'RenderMarkdownWikiLink',
        },
      },

      checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        right_pad = 1,
        unchecked = {
          icon = " ",
          highlight = "RenderMarkdownUnchecked",
          scope_highlight = nil,
        },
        checked = {
          icon = " ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = nil,
        },

        custom = {
          cancelled = {
            raw = "[-]",
            rendered = " ",
            highlight = "RenderMarkdownUnchecked",
            scope_highlight = "RenderMarkdownStrike",
          },
          later = {
            raw = "[l]",
            rendered = " ",
            highlight = "RenderMarkdownLater",
            scope_highlight = nil,
          },
          Problem = {
            raw = "[p]",
            rendered = " ",
            highlight = "RenderMarkdownLater",
            scope_highlight = nil,
          },
        },

      },
    })
  end,
}
