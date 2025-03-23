local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local utils = require("alex.luasnip.utils")

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

local function not_in_latex_mode()
	return not is_in_latex_mode()
end

-- Add snippets
ls.add_snippets("markdown", {

	-- Python Blocks
	s({
		trig = ";py",
		snippetType = "autosnippet",
		condition = not_in_latex_mode,
		dscr = "Insert a python block",
	}, {
		t("```python"),
		t({ "", "" }),
		i(1, "python code"),
		t({ "", "```" }),
	}),
})
