return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		-- General settings for the plugin
		heading = {
			enabled = false,
			--width = 0.25, -- You can change this to 0.25 for a quarter of the screen
		},
		-- Optional: Add other settings here
		preview = {
			enabled = true, -- Enable live preview of rendered markdown
		},
		colors = {
			heading = "#FFD700", -- Customize heading color
			text = "#FFFFFF", -- Customize default text color
		},
	},
	config = function(_, opts)
		-- Set up the plugin with the specified options
		require("render-markdown").setup(opts)
	end,
}
