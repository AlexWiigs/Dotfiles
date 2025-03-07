return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- configure lazy pending updates count

		-- Configure lualine with expanded options and transparent middle sections
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" }, -- Remove separators to avoid black lines
				disabled_filetypes = { statusline = {}, winbar = {} },
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", color = { bg = "none" } }, -- Transparent background
				},
				lualine_x = {
					{ lazy_status.updates, cond = lazy_status.has_updates, color = { fg = "#ff9e64", bg = "none" } },
					{ "encoding", color = { bg = "none" } },
					{ "fileformat", color = { bg = "none" } },
					{ "filetype", color = { bg = "none" } },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
