local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- ls.add_snippets("markdown", {
-- 	s({ trig = "test", snippetType = "autosnippet" }, {
-- 		t("This is an auto-triggered test snippet!"),
-- 	}),
-- })

local conds = require("luasnip.extras.conditions")

ls.add_snippets("markdown", {
	s({
		trig = "test",
		snippetType = "autosnippet",
		condition = function()
			local ts_utils = require("nvim-treesitter.ts_utils")
			local node = ts_utils.get_node_at_cursor()
			while node do
				if node:type() == "latex_block" then
					return true
				end
				node = node:parent()
			end
			return false
		end,
	}, {
		t("This is an auto-triggered test snippet in LaTeX mode!"),
	}),
})
