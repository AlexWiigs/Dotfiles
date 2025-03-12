local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta

local ts_utils = require("nvim-treesitter.ts_utils")

local function in_mathzone()
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "math_environment" or node:type() == "text_mode" then
			return true
		end
		node = node:parent()
	end
	return false
end

return {

	-- Sets
	s({ trig = "in", snippetType = "autosnippet" }, { t("\\in") }, { condition = in_mathzone }),
	-- Hats
	s({ trig = "hat", regTrig = true, wordTrig = false, snippetType = "autosnippet" }, fmta("\\hat{<>}", { i(1) })),

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
		{ trig = "bold", dscr = "BoldSymbols in Mathmode", snippetType = "autosnippet" },
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

	-- Greek Letters
	s(
		{ trig = ";a", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\alpha") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";A", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Alpha") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";b", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\beta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";B", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Beta") },
		{ condition = in_mathzone }
	),
	s(
		{ trig = ";c", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\gamma") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";C", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Gamma") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";d", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\delta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";D", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Delta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";e", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\epsilon") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";E", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Epsilon") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";z", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\zeta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";Z", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Zeta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "eta", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\eta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Eta", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Eta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";t", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\theta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";T", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Theta") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";i", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\iota") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";I", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Iota") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";k", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\kappa") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";K", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Kappa") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";l", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\lambda") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";L", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Lambda") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";m", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\mu") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";M", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Mu") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "nu", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\nu") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Nu", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Nu") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "xi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\xi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Xi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Xi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";o", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\omicron") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";O", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Omicron") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "pi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\pi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Pi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Pi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "rho", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\rho") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Rho", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Rho") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";s", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\sigma") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";S", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Sigma") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "tau", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\tau") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";u", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\upsilon") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";U", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Upsilon") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "phi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\phi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Phi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Phi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "chi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\chi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "Chi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Chi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "psi", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Psi") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";o", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\omega") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = ";O", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\Omega") },
		{ condition = in_mathzone }
	),

	s(
		{ trig = "ell", snippetType = "autosnippet" }, -- Table of snippet parameters
		{ t("\\ell") },
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
