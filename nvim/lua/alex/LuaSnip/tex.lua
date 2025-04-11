local ls = require("luasnip")

-- Load shared math snippets
ls.add_snippets("tex", require("alex.LuaSnip.environments.latex_environments"))
ls.add_snippets("tex", require("alex.LuaSnip.math.math"))
ls.add_snippets("tex", require("alex.LuaSnip.math.greeks"))
