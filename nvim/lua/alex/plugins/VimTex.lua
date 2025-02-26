return {
	"lervag/vimtex",
	ft = "tex", -- Load only for TeX files
	config = function()
		-- Basic VimTeX configuration
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_compiler_method = "latexmk" -- "latexmk"
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_general_viewer = "skim"
		vim.g.vimtex_view_general_options = "--reuse-instance"

		-- Key mappings (optional but recommended)
		vim.api.nvim_set_keymap("n", "<leader>lc", ":VimtexCompile<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>ls", ":VimtexStop<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<leader>lC", ":VimtexClean<CR>", { noremap = true, silent = true })

		-- Auto-indentation settings (optional but useful)
		-- vim.g.vimtex_indent_enabled = 1
		vim.g.vimtex_fold_enabled = 0 -- Enable folding for environments and secthlions
		-- Enhanced conceal options for more conceal usage in math
		vim.o.concealcursor = ""
		vim.g.vimtex_syntax_conceal = {
			accents = 1, -- Conceal accents (e.g., \bar)
			cites = 1, -- Conceal citations
			fancy = 1, -- Conceal fancy characters (e.g., \ell)
			greek = 1, -- Conceal Greek letters
			math_bounds = 1, -- Conceal bounds (e.g., \left, \right)
			math_delimiters = 0, -- Conceal delimiters (e.g., \(, \), \[)
			math_fracs = 1, -- Conceal fractions (\frac)
			math_super_sub = 1, -- Conceal superscripts and subscripts
			math_symbols = 1, -- Conceal symbols (e.g., \times, \cdot)
			sections = 1, -- Conceal section commands (e.g., \section)
			styles = 1, -- Conceal font styles (e.g., \textbf)
		}
	end,
}
