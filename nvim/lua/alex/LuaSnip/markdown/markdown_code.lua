local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Treesitter math condition
-- Table of math-related node types in markdown/LaTeX
local MATH_NODES = { inline_formula = true, displayed_equation = true, math_environment = true }

function in_mathzone()
	-- Get the current node at cursor, including injected languages (e.g. LaTeX in markdown)
	local node = vim.treesitter.get_node({ ignore_injections = false })
	while node do
		local t = node:type()
		if t == "text_mode" then
			-- If inside a LaTeX text-mode block (non-math text in a math environment), it’s not a math zone
			return false
		elseif MATH_NODES[t] then
			-- Found an inline formula, display equation, or math environment
			return true
		end
		node = node:parent()
	end
	return false
end

-- Add math snippet for markdown
ls.add_snippets("markdown", {
	s({
		trig = "alpha",
		snippetType = "autosnippet",
		condition = in_mathzone,
	}, {
		t("\\alpha"),
	}),
})
