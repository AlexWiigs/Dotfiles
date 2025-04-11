local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local MATH_NODES = { inline_formula = true, displayed_equation = true, math_environment = true }

local in_mathzone = function()
	if vim.bo.filetype == "tex" then
		return vim.fn["vimtex#syntax#in_mathzone"]() == 1
	elseif vim.bo.filetype == "markdown" then
		local node = vim.treesitter.get_node({ ignore_injections = false })
		while node do
			local z = node:type()
			if z == "text_mode" then
				-- If inside a LaTeX text-mode block (non-math text in a math environment), it’s not a math zone
				return false
			elseif MATH_NODES[z] then
				-- Found an inline formula, display equation, or math environment
				return true
			end
			node = node:parent()
		end
		return false
	else
		return false
	end
end

local in_textzone = function()
	return not in_mathzone()
end

return {
	s(
		{ trig = "dm", dscr = "Expands 'dm' into equation environment", snippetType = "autosnippet" },
		fmta(
			[[
       $$
       <>
       $$
     ]],
			{ i(1) }
		),
		{ condition = in_textzone }
	),

	-- Math delimiters
	s({ trig = "md", snippetType = "autosnippet" }, fmta("$<>$", { i(1) }), { condition = in_textzone }),

	s(
		{ trig = ";py", dscr = "Expands 'py' into a python codeblock", snippetType = "autosnippet" },
		fmta(
			[[
       ```python
       <>
       ```
     ]],
			{ i(1) }
		),
		{ condition = in_textzone }
	),

	-- text modifiers
	s({ trig = "bm", snippetType = "autosnippet" }, fmta("**<>**", { i(1) }), { condition = in_textzone }),
}
