return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			override_vim_notify = true,
			view = {
				render_message = function(msg, _)
					return msg
				end,
			},
			window = {
				normal_hl = "Comment",
				winblend = 100,
				border = "none",
				zindex = 45,
				max_width = 0,
				max_height = 0,
				x_padding = 1,
				y_padding = 0,
				align = "bottom",
				relative = "editor",
			},
		}, -- <- THIS was missing

		progress = {
			display = {
				done_icon = "✔",
				progress_icon = { "dots" },
				done_ttl = 3,
				progress_ttl = 1000,
				group_style = "Title",
				progress_style = "WarningMsg",
				done_style = "Constant",
			},
		},
	},
}
