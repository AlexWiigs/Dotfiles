-- local ls = require("luasnip")
-- local s = ls.snippet
-- local t = ls.text_node
-- local conds = require("luasnip.extras.conditions")
--
-- ls.add_snippets("markdown", {
-- 	s({
-- 		trig = "test",
-- 		snippetType = "autosnippet",
-- 		condition = function()
-- 			local ts_utils = require("nvim-treesitter.ts_utils")
-- 			local node = ts_utils.get_node_at_cursor()
-- 			while node do
-- 				if node:type() == "latex_block" then
-- 					return true
-- 				end
-- 				node = node:parent()
-- 			end
-- 			return false
-- 		end,
-- 	}, {
-- 		t("This is an auto-triggered test snippet in LaTeX mode!"),
-- 	}),
-- })

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Define the Tree-sitter condition function separately
local function is_in_latex_mode()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "latex_block" then
			return true
		end
		node = node:parent()
	end
	return false
end

-- Add snippets
ls.add_snippets("markdown", {
	s({
		trig = "test",
		snippetType = "autosnippet",
		condition = function()
			-- Explicitly call the function within the snippet to retain context
			return is_in_latex_mode()
		end,
	}, {
		t("This is an auto-triggered test snippet in LaTeX mode!"),
	}),
})
