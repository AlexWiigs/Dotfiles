  local ls = require("luasnip")
  local conds = require("luasnip.extras.expand_conditions")
  local utils = require("luasnip-latex-snippets.util.utils")

  local in_math_zone = conds.in_mathzone()
  local not_in_math_zone = function()
    return not in_math_zone()
  end

-- Math mode snippet for bold symbol
  local bold_math = ls.parser.parse_snippet({ trig = "bs", name = "Bold Symbol", dscr = "Insert \\boldsymbol{} in math mode" }, "\\boldsymbol{${1:$TM_SELECTED_TEXT}}$0")
  bold_math.condition = in_math_zone

  -- Non-math mode snippet for regular bold text
  local bold_text = ls.parser.parse_snippet({ trig = "b", name = "Bold Text", dscr = "Insert \\textbf{} in non-math mode" }, "\\textbf{${1:$TM_SELECTED_TEXT}}$0")
  bold_text.condition = not_in_math_zone

  -- Add snippets to the LuaSnip snippets table for tex files
  ls.add_snippets("tex", {
    bold_math,  -- Math mode snippet
    bold_text   -- Non-math mode snippet
  })
