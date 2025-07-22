return {
	"jpalardy/vim-slime",
	config = function()
		-- Set tmux as the target
		vim.g.slime_target = "tmux"

		-- Default Vim-Slime configuration for tmux
		vim.g.slime_default_config = {
			socket_name = "default", -- Default tmux socket
			target_pane = "workspace:0.0", -- Default target pane (update as needed)
		}

		-- Enable bracketed paste mode for better tmux integration
		vim.g.slime_bracketed_paste = 1

		-- Key mappings for convenience
		vim.api.nvim_set_keymap("n", "<leader>sc", "<Plug>SlimeConfig", { noremap = true, silent = true }) -- Quickly reconfigure vim-slime
		vim.api.nvim_set_keymap("n", "<leader>sa", ":%SlimeSend<CR>", { noremap = true, silent = true }) -- Send the whole file
		vim.api.nvim_set_keymap("v", "<leader>sv", "<Plug>SlimeRegionSend", { noremap = false, silent = true })
	end,
}
