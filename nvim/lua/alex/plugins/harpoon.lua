return {
	{
		"ThePrimeagen/harpoon",
		branch = "master", -- v1 lives on master
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			local conf = require("telescope.config").values
			local function toggle_telescope()
				local harpoon_list = require("harpoon").get_mark_config().marks
				local file_paths = {}
				for _, item in ipairs(harpoon_list) do
					table.insert(file_paths, item.filename)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>a", function()
				mark.add_file()
			end, { desc = "Harpoon: Add file" })

			vim.keymap.set("n", "<leader>r", function()
				mark.rm_file()
			end, { desc = "Harpoon: Remove current file" })

			vim.keymap.set("n", "<C-e>", toggle_telescope, { desc = "Open harpoon window" })

			vim.keymap.set("n", "<C-a>", function()
				ui.nav_file(1)
			end)
			vim.keymap.set("n", "<C-s>", function()
				ui.nav_file(2)
			end)
			vim.keymap.set("n", "<C-d>", function()
				ui.nav_file(3)
			end)
			vim.keymap.set("n", "<C-f>", function()
				ui.nav_file(4)
			end)
			vim.keymap.set("n", "<C-S-P>", function()
				ui.nav_prev()
			end)
			vim.keymap.set("n", "<C-S-N>", function()
				ui.nav_next()
			end)
		end,
	},
}
