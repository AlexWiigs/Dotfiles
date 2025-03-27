local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

-- Add Greek letter snippets
return {
	-- Lowercase Greek letters
	s({ trig = "alpha", snippetType = "autosnippet", condition = in_mathzone }, { t("\\alpha") }),
	s({ trig = "beta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\beta") }),
	s({ trig = "gamma", snippetType = "autosnippet", condition = in_mathzone }, { t("\\gamma") }),
	s({ trig = "delta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\delta") }),
	s({ trig = "epsilon", snippetType = "autosnippet", condition = in_mathzone }, { t("\\epsilon") }),
	s({ trig = "zeta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\zeta") }),
	s({ trig = "eta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\eta") }),
	s({ trig = "theta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\theta") }),
	s({ trig = "iota", snippetType = "autosnippet", condition = in_mathzone }, { t("\\iota") }),
	s({ trig = "kappa", snippetType = "autosnippet", condition = in_mathzone }, { t("\\kappa") }),
	s({ trig = "lambda", snippetType = "autosnippet", condition = in_mathzone }, { t("\\lambda") }),
	s({ trig = "mu", snippetType = "autosnippet", condition = in_mathzone }, { t("\\mu") }),
	s({ trig = "nu", snippetType = "autosnippet", condition = in_mathzone }, { t("\\nu") }),
	s({ trig = "xi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\xi") }),
	s({ trig = "omicron", snippetType = "autosnippet", condition = in_mathzone }, { t("\\omicron") }),
	s({ trig = "pi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\pi") }),
	s({ trig = "rho", snippetType = "autosnippet", condition = in_mathzone }, { t("\\rho") }),
	s({ trig = "sigma", snippetType = "autosnippet", condition = in_mathzone }, { t("\\sigma") }),
	s({ trig = "tau", snippetType = "autosnippet", condition = in_mathzone }, { t("\\tau") }),
	s({ trig = "upsilon", snippetType = "autosnippet", condition = in_mathzone }, { t("\\upsilon") }),
	s({ trig = "phi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\phi") }),
	s({ trig = "chi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\chi") }),
	s({ trig = "psi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\psi") }),
	s({ trig = "omega", snippetType = "autosnippet", condition = in_mathzone }, { t("\\omega") }),

	-- Uppercase Greek letters
	s({ trig = "Alpha", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Alpha") }),
	s({ trig = "Beta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Beta") }),
	s({ trig = "Gamma", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Gamma") }),
	s({ trig = "Delta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Delta") }),
	s({ trig = "Epsilon", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Epsilon") }),
	s({ trig = "Zeta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Zeta") }),
	s({ trig = "Eta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Eta") }),
	s({ trig = "Theta", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Theta") }),
	s({ trig = "Iota", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Iota") }),
	s({ trig = "Lambda", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Lambda") }),
	s({ trig = "Mu", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Mu") }),
	s({ trig = "Nu", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Nu") }),
	s({ trig = "Xi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Xi") }),
	s({ trig = "Omicron", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Omicron") }),
	s({ trig = "Pi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Pi") }),
	s({ trig = "Rho", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Rho") }),
	s({ trig = "Sigma", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Sigma") }),
	s({ trig = "Tau", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Tau") }),
	s({ trig = "Upsilon", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Upsilon") }),
	s({ trig = "Phi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Phi") }),
	s({ trig = "Chi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Chi") }),
	s({ trig = "Psi", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Psi") }),
	s({ trig = "Omega", snippetType = "autosnippet", condition = in_mathzone }, { t("\\Omega") }),
}
