return {
	"lervag/vimtex",
	ft = "tex", -- Load only for TeX files
	config = function()
		-- Basic VimTeX configuration
		vim.g.tex_flavor = "latex"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_general_viewer = "skim"
		vim.g.vimtex_view_general_options = "--reuse-instance"

		-- Key mappings
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }
		keymap("n", "<leader>lc", ":VimtexCompile<CR>", opts)
		keymap("n", "<leader>lv", ":VimtexView<CR>", opts)
		keymap("n", "<leader>ls", ":VimtexStop<CR>", opts)
		keymap("n", "<leader>lC", ":VimtexClean<CR>", opts)
		keymap("n", "<leader>le", ":VimtexErrors<CR>", opts) -- Show errors
		keymap("n", "<leader>li", ":VimtexInfo<CR>", opts) -- Show VimTeX info

		-- Auto-indentation settings
		vim.g.vimtex_indent_enabled = 1

		-- Folding settings
		vim.g.vimtex_fold_enabled = 0
		vim.cmd([[
			setlocal foldmethod=expr
			setlocal foldexpr=vimtex#fold#level()
			setlocal foldlevel=3 " Default fold level (adjust as needed)
		]])

		-- Auto-toggle conceal when entering/exiting insert mode
		vim.cmd([[
			augroup VimTeXConceal
				autocmd!
				autocmd InsertEnter *.tex set conceallevel=0
				autocmd InsertLeave *.tex set conceallevel=2
			augroup END
		]])

		-- Enhanced conceal options for math readability
		vim.o.concealcursor = ""
		vim.g.vimtex_syntax_conceal = {
			accents = 0, -- Conceal accents (e.g., \bar)
			cites = 0, -- Conceal citations
			fancy = 0, -- Conceal fancy characters (e.g., \ell)
			greek = 0, -- Conceal Greek letters
			math_bounds = 0, -- Conceal bounds (e.g., \left, \right)
			math_delimiters = 0, -- Conceal delimiters (e.g., \(, \), \[)
			math_fracs = 0, -- Conceal fractions (\frac)
			math_super_sub = 0, -- Conceal superscripts and subscripts
			math_symbols = 0, -- Conceal symbols (e.g., \times, \cdot)
			sections = 0, -- Conceal section commands (e.g., \section)
			styles = 0, -- Conceal font styles (e.g., \textbf)
		}
	end,
}
