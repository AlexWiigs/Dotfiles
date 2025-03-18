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
				horizontal_rules = presets.dashed,
				tables = presets.rounded,
			},
		})
	end,
}
