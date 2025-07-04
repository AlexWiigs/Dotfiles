return {
	"OXY2DEV/markview.nvim",
	ft = "markdown", -- Load plugin when editing markdown files
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"echasnovski/mini.nvim",
	},
	config = function()
		local presets = require("markview.presets")

		require("markview").setup({
			markdown = {
				headings = presets.headings.slanted,
				horizontal_rules = presets.horizontal_rules.thin,
				tables = presets.tables.rounded,
			},
			yaml = {
				enable = true,
				properties = {},
			},
		})

		vim.defer_fn(function()
			vim.cmd([[
        hi MarkviewCode guibg=NONE
        hi MarkviewCodeInfo guibg=NONE
        hi MarkviewInlineCode guibg=NONE
        hi MarkviewIcon3 guibg=NONE
      ]])
		end, 100)
	end,
}
