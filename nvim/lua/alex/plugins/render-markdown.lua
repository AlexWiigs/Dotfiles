return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	---@module 'render-markdown'
	---@type render.md.UserConfig
	opts = {
		heading = {
			width = "block",
			min_width = 30,
		},

		checkbox = {
			checked = { scope_highlight = "@markup.strikethrough" },
		},

		code = {
			width = "block",
			min_width = 45,
			left_pad = 2,
			language_pad = 2,
		},
	},
}
