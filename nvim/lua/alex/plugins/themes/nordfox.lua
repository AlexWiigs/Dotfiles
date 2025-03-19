return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- Ensure this theme loads first
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true, -- Set to true if you want a transparent background
				terminal_colors = true, -- Enable terminal colors
				dim_inactive = false, -- Keep inactive windows the same brightness
				module_default = true, -- Use default settings for modules
			},
			styles = {
				comments = "italic",
				keywords = "bold",
				functions = "NONE",
				strings = "NONE",
				variables = "NONE",
			},
			inverse = {
				match_paren = false,
				visual = false,
				search = false,
			},
		})
		vim.cmd("colorscheme nordfox")
	end,
}
