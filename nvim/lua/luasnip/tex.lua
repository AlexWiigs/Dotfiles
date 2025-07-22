local ls = require("luasnip")

-- Load shared math snippets
ls.add_snippets("tex", require("luasnip.environments.latex_environments"))
ls.add_snippets("tex", require("luasnip.math.math"))
ls.add_snippets("tex", require("luasnip.math.greeks"))
