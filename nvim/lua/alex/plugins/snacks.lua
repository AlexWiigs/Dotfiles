return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		dashboard = {
			header = {
				"  ██████╗ ███╗   ██╗ █████╗  ██████╗██╗  ██╗",
				"  ██╔══██╗████╗  ██║██╔══██╗██╔════╝██║  ██║",
				"  ██████╔╝██╔██╗ ██║███████║██║     ███████║",
				"  ██╔═══╝ ██║╚██╗██║██╔══██║██║     ██╔══██║",
				"  ██║     ██║ ╚████║██║  ██║╚██████╗██║  ██║",
				"  ╚═╝     ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝",
			}, -- Custom ASCII art for the header

			buttons = {
				{ "  New File", "e ~/.config/nvim/init.lua", "n" },
				{ "  Open File", "Telescope find_files", "f" },
				{ "  Update Plugins", "Lazy update", "u" },
				{ "  Quit", "qa", "q" },
			},

			footer = { "Welcome to Neovim 🚀" },
		},
	},
}
