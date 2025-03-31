local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {

	----------- MATH MODE -------------
	s({ trig = "in", snippetType = "autosnippet" }, { t("\\in") }, { condition = in_mathzone }),
	-- Hats
	s(
		{ trig = "hat", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("\\hat{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "tilde", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("\\tilde{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	-- Probability
	s(
		{ trig = "prob", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("\\Pr(<>)", { i(1) }),
		{ condition = in_mathzone }
	),

	-- Inequalities
	s({ trig = "leq", snippetType = "autosnippet" }, { t("\\leq") }, { condition = in_mathzone }),

	s({ trig = "geq", snippetType = "autosnippet" }, { t("\\geq") }, { condition = in_mathzone }),

	-- superscript and upperscript
	s(
		{ trig = "dr", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("^{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "rd", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("_{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	-- Dots
	s({ trig = "...", dscr = "dots", snippetType = "autosnippet" }, { t("\\dots") }, { condition = in_mathzone }),

	-- Summations and Products
	s(
		{ trig = "sumin", dscr = "Summation with i and n", snippetType = "autosnippet" },
		{ t("\\sum_{i=1}^{n}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "sum", dscr = "Summation", snippetType = "autosnippet" },
		fmta("\\sum_{<>}^{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),

	s(
		{ trig = "part", dscr = "partial derivative", snippetType = "autosnippet" },
		{ t("\\partial") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "prodin", dscr = "Summation with i and n", snippetType = "autosnippet" },
		{ t("\\prod_{i=1}^{n}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "prod", dscr = "Summation", snippetType = "autosnippet" },
		fmta("\\prod_{<>}^{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),
	-- Words
	s(
		{ trig = "det", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\text{det}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "trace", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\text{trace}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "log", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\log") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "min", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\min") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "max", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\max") },
		{ condition = in_mathzone }
	),

	-- BoldSymbol
	s(
		{ trig = "bm", dscr = "BoldSymbols in Mathmode", snippetType = "autosnippet" },
		fmta("\\bm{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	-- Text
	s(
		{ trig = "text", dscr = "text inside mathmode", snippetType = "autosnippet" },
		fmta("\\text{<>}", { i(1) }),
		{ condition = in_mathzone }
	),

	-- Fractions
	s(
		{ trig = "ff", dscr = "Fraction shortcut", snippetType = "autosnippet" },
		fmta("\\frac{<>}{<>}", { i(1), i(2) }),
		{ condition = in_mathzone }
	),

	-- Matrices
	s(
		{ trig = ";mat", dscr = "matrix", snippetType = "autosnippet" },
		fmta(
			[[
          \begin{<>matrix}
          <>
          \end{<>matrix}
          ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = in_mathzone }
	),
}
