local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Define the Tree-sitter condition function
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
	-- Fraction snippet
	s({
		trig = "ff",
		snippetType = "autosnippet",
		condition = is_in_latex_mode(), -- Use shared function
		dscr = "Insert a fraction: \\frac{numerator}{denominator}",
	}, {
		t("\\frac{"),
		i(1, "numerator"),
		t("}{"),
		i(2, "denominator"),
		t("}"),
	}),

	-- Derivative snippet
	s({
		trig = "deriv",
		snippetType = "autosnippet",
		condition = function()
			return is_in_latex_mode()
		end,
		dscr = "Insert a derivative: \frac{d}{d}",
	}, {
		t("\\frac{d}{d"),
		i(1, "variable"),
		t("}{"),
		i(2, "function"),
		t("}"),
	}),

	-- Partial Derivative snippet
	s({
		trig = "partial",
		snippetType = "autosnippet",
		condition = function()
			return is_in_latex_mode()
		end,
		dscr = "Insert a partial derivative: \frac{partial}{partial}",
	}, {
		t("\\frac{\\partial}{\\partial"),
		i(1, "variable"),
		t("}{"),
		i(2, "function"),
		t("}"),
	}),

	-- Summation snippet
	s({
		trig = "sum",
		snippetType = "autosnippet",
		condition = is_in_latex_mode(),
		dscr = "Insert a summation: sum_{lower}^{upper}",
	}, {
		t("\\sum_{"),
		i(1, "lower"),
		t("}^{"),
		i(2, "upper"),
		t("}"),
	}),

	-- Integral snippet
	s({
		trig = "int",
		snippetType = "autosnippet",
		condition = is_in_latex_mode(),
		dscr = "Insert an integral: int_{lower}^{upper}",
	}, {
		t("\\int_{"),
		i(1, "lower"),
		t("}^{"),
		i(2, "upper"),
		t("}"),
	}),

	-- Subscript
})
