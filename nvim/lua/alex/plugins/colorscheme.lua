return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- Ensure this theme loads first
	config = function()
		require("nightfox").setup({
			options = {
				transparent = false, -- Set to true if you want a transparent background
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

		-- Set colorscheme (change "nightfox" to "dayfox" for light mode)
		vim.cmd("colorscheme nordfox") -- Options: nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
	end,
}
