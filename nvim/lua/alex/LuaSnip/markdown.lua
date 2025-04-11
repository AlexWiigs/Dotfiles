local ls = require("luasnip")

-- Load shared math snippets
ls.add_snippets("markdown", require("alex.LuaSnip.environments.markdown_environments"))
ls.add_snippets("markdown", require("alex.LuaSnip.math.math"))
ls.add_snippets("markdown", require("alex.LuaSnip.math.greeks"))
