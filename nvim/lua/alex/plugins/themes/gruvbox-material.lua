-- lua/plugins/colorscheme.lua
return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	name = "gruvbox-material",
	config = function()
		-- Recommended settings
		vim.g.gruvbox_material_foreground = "soft" -- soft, medium, mix
		vim.g.gruvbox_material_background = "soft" -- hard, medium, soft
		vim.g.gruvbox_material_enable_italic = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_transparent_background = 1
		vim.g.gruvbox_material_ui_contrast = "low" -- low, high
		vim.g.gruvbox_material_statusline_style = "mix" -- default, mix, original
		vim.g.gruvbox_material_diagnostic_virtual_text = "colored" -- grey, colored, highlight

		-- Apply the colorscheme
		vim.cmd("colorscheme gruvbox-material")
	end,
}
