return {
	dashboard = {
		width = 60,
		row = nil, -- Centered by default
		col = nil, -- Centered by default
		pane_gap = 4, -- Space between sections
		autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- Auto key sequence

		preset = {
			pick = nil,
			keys = {
				{
					icon = " ",
					key = "f",
					desc = "Find File",
					action = ":lua require('snacks.dashboard').pick('files')",
				},
				{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
				{
					icon = " ",
					key = "g",
					desc = "Find Text",
					action = ":lua require('snacks.dashboard').pick('live_grep')",
				},
				{
					icon = " ",
					key = "r",
					desc = "Recent Files",
					action = ":lua require('snacks.dashboard').pick('oldfiles')",
				},
				{
					icon = " ",
					key = "c",
					desc = "Config",
					action = ":lua require('snacks.dashboard').pick('files', {cwd = vim.fn.stdpath('config')})",
				},
				{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
				{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
				{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
			},
			header = [[
                    ___                       ___           ___           ___           ___           ___      
                   /\  \                     /\  \         /\__\         /\  \         /\  \         /|  |     
      ___          \:\  \       ___          \:\  \       /:/  /         \:\  \        \:\  \       |:|  |     
     /\  \          \:\  \     /\__\          \:\  \     /:/  /           \:\  \        \:\  \      |:|  |     
    /::\  \     ___  \:\  \   /:/__/      _____\:\  \   /:/  /  ___   ___  \:\  \   _____\:\  \   __|:|__|     
   /:/\:\  \   /\  \  \:\__\ /::\  \     /::::::::\__\ /:/__/  /\__\ /\  \  \:\__\ /::::::::\__\ /::::\__\_____
  /:/ /::\  \  \:\  \ /:/  / \/\:\  \__  \:\~~\~~\/__/ \:\  \ /:/  / \:\  \ /:/  / \:\~~\~~\/__/ ~~~~\::::/___/
 /:/_/:/\:\__\  \:\  /:/  /   ~~\:\/\__\  \:\  \        \:\  /:/  /   \:\  /:/  /   \:\  \           |:|~~|    
 \:\/:/  \/__/   \:\/:/  /       \::/  /   \:\  \        \:\/:/  /     \:\/:/  /     \:\  \          |:|  |    
  \::/  /         \::/  /        /:/  /     \:\__\        \::/  /       \::/  /       \:\__\         |:|__|    
   \/__/           \/__/         \/__/       \/__/         \/__/         \/__/         \/__/         |/__/     
]],
		},
	},
}
