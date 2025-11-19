return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0", -- stick to 1.x for now
		dependencies = { "3rd/image.nvim" },
		build = ":UpdateRemotePlugins",
		ft = { "python", "markdown", "quarto" }, -- only load where you’ll actually run code

		init = function()
			-- molten display prefs
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_output_win_max_height = 20
		end,

		config = function()
			------------------------------------------------------------------
			-- Basic molten keymaps (buffer-local when molten is initialized)
			------------------------------------------------------------------
			vim.api.nvim_create_autocmd("User", {
				pattern = "MoltenInitPost",
				callback = function()
					-- init / line / visual, following molten readme
					vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", {
						silent = true,
						desc = "Molten: init kernel",
						buffer = true,
					})
					vim.keymap.set("n", "<localleader>ml", ":MoltenEvaluateLine<CR>", {
						silent = true,
						desc = "Molten: run line",
						buffer = true,
					})
					vim.keymap.set(
						"v",
						"<localleader>mv",
						":<C-u>MoltenEvaluateVisual<CR>gv",
						{ silent = true, desc = "Molten: run visual", buffer = true }
					)
				end,
			})

			------------------------------------------------------------------
			-- Fenced block support for markdown / quarto with <M-c>
			------------------------------------------------------------------
			local function run_current_fence()
				local buf = vim.api.nvim_get_current_buf()
				local total = vim.api.nvim_buf_line_count(buf)
				local cur_line = vim.api.nvim_win_get_cursor(0)[1]

				-- search upward for ``` fence
				local start_line = cur_line
				while start_line > 1 do
					local line = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1] or ""
					if line:match("^```") then
						break
					end
					start_line = start_line - 1
				end

				local start_text = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1] or ""
				if not start_text:match("^```") then
					vim.notify("Molten: no fenced block start found above cursor", vim.log.levels.WARN)
					return
				end

				-- search downward for matching ```
				local end_line = start_line + 1
				while end_line <= total do
					local line = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1] or ""
					if line:match("^```") then
						break
					end
					end_line = end_line + 1
				end

				local end_text = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1] or ""
				if (not end_text:match("^```")) or end_line <= start_line + 1 then
					vim.notify("Molten: no fenced block end found below cursor", vim.log.levels.WARN)
					return
				end

				-- optional: only run python blocks (```python or ```{python})
				local lang = start_text:match("^```%s*{(%w+)") or start_text:match("^```%s*(%w+)")
				if lang and lang ~= "python" then
					vim.notify("Molten: fenced block language '" .. lang .. "' (skipping)", vim.log.levels.INFO)
					return
				end

				-- visually select the body of the fence and call MoltenEvaluateVisual
				local first_code = start_line + 1
				local last_code = end_line - 1
				local count = last_code - first_code + 1
				if count <= 0 then
					vim.notify("Molten: fenced block is empty", vim.log.levels.INFO)
					return
				end

				-- move to first code line
				vim.api.nvim_win_set_cursor(0, { first_code, 0 })

				-- enter Visual-line mode and extend to last_code
				local keys = "V"
				if count > 1 then
					keys = keys .. tostring(count - 1) .. "j"
				end
				-- now feed the recommended visual-eval command
				keys = keys .. ":<C-u>MoltenEvaluateVisual<CR>gv"

				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, false, true), "n", false)
			end

			-- only map <M-c> in markdown / quarto buffers
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "markdown", "quarto" },
				callback = function(args)
					vim.keymap.set(
						"n",
						"<M-c>",
						run_current_fence,
						{ buffer = args.buf, desc = "Molten: run fenced code block" }
					)
				end,
			})
		end,
	},
	{
		"3rd/image.nvim",
		opts = {
			backend = "kitty",
			integrations = {
				markdown = { enabled = false },
				neorg = { enabled = false },
				typst = { enabled = false },
			},
			max_width = 100,
			max_height = 12,
			max_height_window_percentage = math.huge,
			max_width_window_percentage = math.huge,
			window_overlap_clear_enabled = true,
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		},
	},
}
