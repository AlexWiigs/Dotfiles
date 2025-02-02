local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local utils = require("alex.luasnip.utils")

ls.add_snippets("markdown", {
	-- Inline Math snippet
	s({
		trig = "dm",
		snippetType = "autosnippet",
		condition = utils.not_in_latex_mode,
		dscr = "Insert inline math: $ ... $",
	}, {
		t("$"),
		i(1, "math content"),
		t("$"),
	}),

	-- Math Block snippet
	s({
		trig = "md",
		snippetType = "autosnippet",
		condition = function()
			return not utils.is_in_latex_mode()
		end,
		dscr = "Insert math block: $$ ... $$",
	}, {
		t("$$"),
		t({ "", "" }),
		i(1, "math content"),
		t({ "", "$$" }),
	}),

	-- Aligned math block
	s({
		trig = ";align",
		snippetType = "autosnippet",
		condition = utils.is_in_latex_mode,
		dscr = "Insert aligned math block",
	}, {
		t("\\begin{align}"),
		t({ "", "" }),
		i(1, "aligned math content"),
		t({ "", "\\end{align}" }),
	}),

	-- Code Block snippet
	-- Code Block snippet
	s({
		trig = "cb",
		snippetType = "autosnippet",
		condition = function()
			return not utils.is_in_latex_mode()
		end,
		dscr = "Insert a fenced code block",
	}, {
		t({ "```" }),
		i(1, "language"),
		t({ "", "" }), -- Language spec with empty lines for newlines
		i(2, "code content"), -- Placeholder for code content
		t({ "", "```" }), -- Closing the code block
	}),
})
