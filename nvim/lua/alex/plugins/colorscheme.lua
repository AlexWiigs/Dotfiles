return {
	{
		"navarasu/onedark.nvim",
		lazy = false, -- Load immediately
		priority = 1000, -- Ensure this theme loads first
		config = function()
			require("onedark").setup({
				style = "dark", -- Set the style to 'dark'
				transparent = true, -- Set to true if you want transparency
				term_colors = true, -- Use terminal colors
				code_style = {
					comments = "italic",
					keywords = "bold",
					functions = "italic,bold",
					strings = "none",
					variables = "none",
				},
				lualine = {
					transparent = true, -- Lualine transparency
				},
			})
			require("onedark").load() -- Apply the theme
		end,
	},
}
