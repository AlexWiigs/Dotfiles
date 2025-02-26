-- return {
-- 	{
-- 		"navarasu/onedark.nvim",
-- 		lazy = false, -- Load immediately
-- 		priority = 1000, -- Ensure this theme loads first
-- 		config = function()
-- 			require("onedark").setup({
-- 				style = "dark", -- Set the style to 'dark'
-- 				transparent = false, -- Set to true if you want transparency
-- 				term_colors = true, -- Use terminal colors
-- 				code_style = {
-- 					comments = "none",
-- 					keywords = "bold",
-- 					functions = "italic,bold",
-- 					strings = "none",
-- 					variables = "none",
-- 				},
-- 				lualine = {
-- 					transparent = true, -- Lualine transparency
-- 				},
-- 			})
-- 			require("onedark").load() -- Apply the theme
-- 		end,
-- 	},
-- }

return {
	"AlexvZyl/nordic.nvim",
	lazy = false, -- Load immediately
	priority = 1000, -- Ensure this theme loads first
	config = function()
		require("nordic").load()

		require("nordic").setup({
			transparent_bg = false, -- Disable transparency
			bold_keywords = true,
			italic_comments = true,
			bright_border = false,
			cursorline = {
				bold = false,
				theme = "light", -- Options: "dark", "light"
				blend = 0.35,
			},
			telescope = {
				style = "flat", -- Options: "classic", "flat", "bordered"
			},
		})
	end,
}
