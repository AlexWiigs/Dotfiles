local in_textzone = function()
	-- The `in_mathzone` function requires the VimTeX plugin
	return vim.fn["vimtex#syntax#in_mathzone"]() == 0
end

return {

	-- Equation Enviroment
	s(
		{ trig = "dm", dscr = "Expands 'eq' into an equation environment", snippetType = "autosnippet" },
		fmta(
			[[
         $$
             <>
         $$
       ]],
			{ i(1) },
			{ condition = in_textzone }
		)
	),

	s(
		{ trig = ";align", snippetType = "autosnippet" },
		fmta(
			[[
         \begin{align*}
             <>
         \end{align*}
       ]],
			{ i(1) },
			{ condition = in_textzone }
		)
	),

	s({ trig = "md", snippetType = "autosnippet" }, fmta("$<>$", { i(1) }), { condition = in_textzone }),
}
