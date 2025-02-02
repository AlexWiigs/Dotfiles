return {
	"jpalardy/vim-slime",
	config = function()
		-- Basic vim-slime configuration
		vim.g.slime_target = "tmux" -- Use tmux as the target
		vim.g.slime_default_config = {
			socket_name = "default", -- Default tmux socket
			target_pane = "workspace:0.0", -- Default target pane (update as needed)
		}
		vim.g.slime_bracketed_paste = 1 -- Enable bracketed paste mode for better tmux integration

		-- Automatically configure slime for MATLAB files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "matlab", -- For .m files (Treesitter recognizes MATLAB as "matlab")
			callback = function()
				vim.g.slime_default_config = {
					socket_name = "default", -- Replace with your MATLAB tmux socket name if different
					target_pane = ":matlab", -- Replace with the tmux pane running MATLAB
				}
			end,
		})

		-- Optional key mappings for convenience
		vim.api.nvim_set_keymap("n", "<leader>sc", "<Plug>SlimeConfig", { noremap = true, silent = true }) -- Quickly reconfigure vim-slime
		vim.api.nvim_set_keymap("v", "<leader>ss", "<C-c><C-c>", { noremap = false, silent = true }) -- Send code to tmux
	end,
	keys = {
		{ "<leader>sc", mode = "n" },
		{ "<leader>ss", mode = "n" },
	},
}
