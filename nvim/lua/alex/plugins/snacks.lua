return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local dashboard = require("alex.plugins.snacks.dashboard")
		local image = require("alex.plugins.snacks.image")

		require("snacks").setup(vim.tbl_deep_extend("force", dashboard, image))
	end,
}
