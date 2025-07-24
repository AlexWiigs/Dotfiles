local ls = require("luasnip")

-- Load shared math snippets
ls.add_snippets("markdown", require("luasnip.environments.markdown_environments"))
ls.add_snippets("markdown", require("luasnip.math.math"))
ls.add_snippets("markdown", require("luasnip.math.greeks"))
