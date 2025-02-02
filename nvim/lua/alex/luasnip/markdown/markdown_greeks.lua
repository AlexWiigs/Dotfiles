local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local utils = require("alex.luasnip.utils") -- Ensure this path is correct

-- Add Greek letter snippets
ls.add_snippets("markdown", {
	-- Lowercase Greek letters
	s({ trig = "alpha", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\alpha") }),
	s({ trig = "beta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\beta") }),
	s({ trig = "gamma", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\gamma") }),
	s({ trig = "delta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\delta") }),
	s({ trig = "epsilon", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\epsilon") }),
	s({ trig = "zeta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\zeta") }),
	s({ trig = "eta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\eta") }),
	s({ trig = "theta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\theta") }),
	s({ trig = "iota", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\iota") }),
	s({ trig = "kappa", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\kappa") }),
	s({ trig = "lambda", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\lambda") }),
	s({ trig = "mu", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\mu") }),
	s({ trig = "nu", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\nu") }),
	s({ trig = "xi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\xi") }),
	s({ trig = "omicron", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\omicron") }),
	s({ trig = "pi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\pi") }),
	s({ trig = "rho", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\rho") }),
	s({ trig = "sigma", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\sigma") }),
	s({ trig = "tau", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\tau") }),
	s({ trig = "upsilon", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\upsilon") }),
	s({ trig = "phi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\phi") }),
	s({ trig = "chi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\chi") }),
	s({ trig = "psi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\psi") }),
	s({ trig = "omega", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\omega") }),

	-- Uppercase Greek letters
	s({ trig = "Alpha", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Alpha") }),
	s({ trig = "Beta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Beta") }),
	s({ trig = "Gamma", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Gamma") }),
	s({ trig = "Delta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Delta") }),
	s({ trig = "Epsilon", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Epsilon") }),
	s({ trig = "Zeta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Zeta") }),
	s({ trig = "Eta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Eta") }),
	s({ trig = "Theta", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Theta") }),
	s({ trig = "Iota", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Iota") }),
	s({ trig = "Kappa", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Kappa") }),
	s({ trig = "Lambda", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Lambda") }),
	s({ trig = "Mu", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Mu") }),
	s({ trig = "Nu", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Nu") }),
	s({ trig = "Xi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Xi") }),
	s({ trig = "Omicron", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Omicron") }),
	s({ trig = "Pi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Pi") }),
	s({ trig = "Rho", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Rho") }),
	s({ trig = "Sigma", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Sigma") }),
	s({ trig = "Tau", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Tau") }),
	s({ trig = "Upsilon", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Upsilon") }),
	s({ trig = "Phi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Phi") }),
	s({ trig = "Chi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Chi") }),
	s({ trig = "Psi", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Psi") }),
	s({ trig = "Omega", snippetType = "autosnippet", condition = utils.is_in_latex_mode }, { t("\\Omega") }),
})
