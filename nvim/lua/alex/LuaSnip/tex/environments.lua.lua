local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
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

	-- Align environment
	s(
		{ trig = ";align", snippetType = "autosnippet" },
		fmta(
			[[
        \begin{align*}
          <>
        \end{align*}
      ]],
			{ i(1) }
		),
		{ condition = in_textzone }
	),

	-- General Begin environment
	s(
		{ trig = ";beg", dscr = "begin", snippetType = "autosnippet" },
		fmta(
			[[
          \begin{<>}
            <>
          \end{<>}
          ]],
			{ i(1), i(2), rep(1) }
		),
		{ condition = in_textzone }
	),

	-- Math delimiters
	s({ trig = "md", snippetType = "autosnippet" }, fmta("$<>$", { i(1) }), { condition = in_textzone }),
}
