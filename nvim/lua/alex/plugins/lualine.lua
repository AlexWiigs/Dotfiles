return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "echasnovski/mini.nvim" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- configure lazy pending updates count

		-- Make the middle section transparent dynamically
		local auto = require("lualine.themes.auto")
		local lualine_modes = { "insert", "normal", "visual", "command", "replace", "inactive", "terminal" }
		for _, field in pairs(lualine_modes) do
			if auto[field] and auto[field].c then
				auto[field].c.bg = "NONE"
			end
		end

		-- Configure lualine with expanded options and pilled sections for mode and location
		lualine.setup({
			options = {
				icons_enabled = true,
				theme = auto, -- Use modified theme with transparent middle
				component_separators = { left = " ", right = " " },
				section_separators = { left = "", right = "" }, -- Keep everything else as it is
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
				lualine_a = {
					{ "mode", separator = { left = "", right = "" } },
				},
				lualine_b = { { "branch", "diff", "diagnostics", color = { bg = "none" } } },
				lualine_c = {
					{ "filename", color = { bg = "none" } }, -- Keep transparent
				},
				lualine_x = {
					{ lazy_status.updates, cond = lazy_status.has_updates },
					{ "filetype" },
				},
				lualine_y = { { "progress", color = { bg = "none" } } },
				lualine_z = {
					{ "location", separator = { left = "", right = "" } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename" } },
				lualine_x = { { "location" } },
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
