local ls   = require("luasnip")
local s    = ls.snippet
local i    = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- TS nodes that indicate math (TeX + Markdown/Quarto)
local MATH_NODES = {
  inline_math = true, inline_formula = true,        -- TeX inline
  displayed_equation = true, math_environment = true, -- TeX blocks/envs
  math_inline = true, math_block = true,            -- Markdown/Quarto
}

local in_mathzone = function()
  if not vim.tbl_contains({ "tex", "markdown", "quarto" }, vim.bo.filetype) then return false end
  local node = vim.treesitter.get_node({ ignore_injections = false })
  while node do
    local t = node:type()
    if t == "text_mode" then return false end      -- non-math text inside math env
    if MATH_NODES[t] then return true end
    node = node:parent()
  end
  return false
end

local in_textzone = function() return not in_mathzone() end
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

  -- Text autosnippets
	s({ trig = "bm", snippetType = "autosnippet" }, fmta("\\textbf{<>}", { i(1) }), { condition = in_textzone }),

	-- Add Nomenclature
	s(
		{ trig = ";nom", snippetType = "autosnippet" },
		fmta("\\nomenclature{<>}{<>}", { i(1), i(2) }),
		{ condition = in_textzone }
	),
}
