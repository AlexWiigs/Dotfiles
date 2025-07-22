local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local MATH_NODES = { inline_formula = true, displayed_equation = true, math_environment = true }

local in_mathzone = function()
	if vim.bo.filetype == "tex" then
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1
	elseif vim.bo.filetype == "markdown" then
		local node = vim.treesitter.get_node({ ignore_injections = false })
		while node do
			local z = node:type()
			if MATH_NODES[z] then
				return true
			elseif z == "text_mode" then
				return false
			end
			node = node:parent()
		end
	end
	return false
end

return {

	----------- MATH MODE -------------
	s({ trig = ";in", snippetType = "autosnippet" }, { t("\\in") }, { condition = in_mathzone }),

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

	-- Trigonometric Functions
	s({ trig = "sin", dscr = "sin", snippetType = "autosnippet" }, { t("\\sin") }, { condition = in_mathzone }),
	s({ trig = "cos", dscr = "cos", snippetType = "autosnippet" }, { t("\\cos") }, { condition = in_mathzone }),
	s({ trig = "tan", dscr = "tan", snippetType = "autosnippet" }, { t("\\tan") }, { condition = in_mathzone }),

	s({ trig = "cot", dscr = "cot", snippetType = "autosnippet" }, { t("\\cot") }, { condition = in_mathzone }),
	s({ trig = "sec", dscr = "sec", snippetType = "autosnippet" }, { t("\\sec") }, { condition = in_mathzone }),
	s({ trig = "csc", dscr = "csc", snippetType = "autosnippet" }, { t("\\csc") }, { condition = in_mathzone }),

	-- Hyperbolic Functions
	-- s({ trig = "sinh", dscr = "sinh", snippetType = "autosnippet" }, { t("\\sinh") }, { condition = in_mathzone }),
	-- s({ trig = "cosh", dscr = "cosh", snippetType = "autosnippet" }, { t("\\cosh") }, { condition = in_mathzone }),
	-- s({ trig = "tanh", dscr = "tanh", snippetType = "autosnippet" }, { t("\\tanh") }, { condition = in_mathzone }),
	--
	-- s({ trig = "coth", dscr = "coth", snippetType = "autosnippet" }, { t("\\coth") }, { condition = in_mathzone }),
	-- s({ trig = "sech", dscr = "sech", snippetType = "autosnippet" }, { t("\\sech") }, { condition = in_mathzone }),
	-- s({ trig = "csch", dscr = "csch", snippetType = "autosnippet" }, { t("\\csch") }, { condition = in_mathzone }),

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
		{ trig = ";der", dscr = "Derivative", snippetType = "autosnippet" },
		fmta("\\frac{d}{d <>}", { i(1) }),
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
		{ trig = ";det", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\text{det}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "trace", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\text{trace}") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";log", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\log") },
		{ condition = in_mathzone }
	),

	s({ trig = ";ln", snippetType = "autosnippet" }, { t("\\ln") }, { condition = in_mathzone }),

	s(
		{ trig = ";min", snippetType = "autosnippet" }, -- Table of snippet parameters
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
		{ trig = ";ff", dscr = "Fraction shortcut", snippetType = "autosnippet" },
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

	s(
		{ trig = ";align", dscr = "align", snippetType = "autosnippet" },
		fmta(
			[[
          \begin{align}
            <>
          \end{align}
          ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
}
