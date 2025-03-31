return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local presets = require("markview.presets") -- Load presets

		require("markview").setup({
			markdown = {
				headings = presets.headings.simple,
				horizontal_rules = presets.horizontal_rules.dotted,
				tables = presets.tables.rounded,
			},
			yaml = {
				enable = true,
				properties = {},
			},
		})

		-- Force apply highlight fixes AFTER Markview loads with a delay
		--  NOTE:  This is just a temporary fix until git config is updated.
		vim.defer_fn(function()
			vim.cmd([[
                hi MarkviewCode guibg=NONE
                hi MarkviewCodeInfo guibg=NONE
                " hi MarkviewMath guibg=NONE
                " hi MarkviewYAML guibg=NONE
                hi MarkviewInlineCode guibg=NONE
                " hi MarkviewBlockQuote guibg=NONE
                " hi MarkviewIcon0 guibg=NONE
                " hi MarkviewIcon1 guibg=NONE
                " hi MarkviewIcon2 guibg=NONE
                hi MarkviewIcon3 guibg=NONE
                " hi MarkviewIcon4 guibg=NONE 
                " hi MarkviewIcon5 guibg=NONE
                " hi MarkviewIcon6 guibg=NONE
            ]])
		end, 100) -- Delay in milliseconds (100ms should be enough)
	end,
}
