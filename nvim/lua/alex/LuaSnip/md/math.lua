local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

return {

  -- Basic math operators
  s({ trig = "in", snippetType = "autosnippet" }, { t("\\in") }),
  s({ trig = "leq", snippetType = "autosnippet" }, { t("\\leq") }),
  s({ trig = "geq", snippetType = "autosnippet" }, { t("\\geq") }),

  -- Hats and Tildes
  s(
    { trig = "hat", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\hat{<>}", { i(1) })
  ),
  s(
    { trig = "tilde", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\tilde{<>}", { i(1) })
  ),

  -- Probability
  s(
    { trig = "prob", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("\\Pr(<>)", { i(1) })
  ),

  -- Superscripts and Subscripts
  s(
    { trig = "dr", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("^{<>}", { i(1) })
  ),
  s(
    { trig = "rd", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("_{<>}", { i(1) })
  ),

  -- Fractions
  s(
    { trig = "ff", dscr = "Fraction shortcut", snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", { i(1), i(2) })
  ),

  -- Greek letters
  s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
  s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
  s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),
  s({ trig = ";d", snippetType = "autosnippet" }, { t("\\delta") }),
  s({ trig = ";t", snippetType = "autosnippet" }, { t("\\theta") }),
  s({ trig = ";l", snippetType = "autosnippet" }, { t("\\lambda") }),

  -- Bold symbols
  s(
    { trig = "bold", dscr = "Bold symbols in math mode", snippetType = "autosnippet" },
    fmta("\\bm{<>}", { i(1) })
  ),

  -- Summations and Products
  s(
    { trig = "sum", dscr = "Summation", snippetType = "autosnippet" },
    fmta("\\sum_{<>}^{<>}", { i(1), i(2) })
  ),
  s(
    { trig = "prod", dscr = "Product", snippetType = "autosnippet" },
    fmta("\\prod_{<>}^{<>}", { i(1), i(2) })
  ),

  -- Matrices
  s(
    { trig = ";mat", dscr = "Matrix", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>matrix}
        <>
      \end{<>matrix}
      ]],
      { i(1, "b"), i(2), i(1) }
    )
  ),

  -- Text inside math mode
  s(
    { trig = "text", dscr = "Text inside math mode", snippetType = "autosnippet" },
    fmta("\\text{<>}", { i(1) })
  ),

  -- Partial derivative
  s(
    { trig = "part", dscr = "Partial derivative", snippetType = "autosnippet" },
    { t("\\partial") }
  ),

  -- Dots
  s({ trig = "...", dscr = "Dots", snippetType = "autosnippet" }, { t("\\dots") }),
}
