return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    -- Engine & compiler
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk_engines = { _ = "-xelatex" } -- force xelatex
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-xelatex",          -- XeLaTeX (works with fontspec & minted)
        "-shell-escape",     -- needed for minted
        "-synctex=1",
        "-file-line-error",
        "-halt-on-error",
        "-interaction=nonstopmode",
      },
    }

    -- Viewer
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = "skim"
    vim.g.vimtex_view_general_options = "--reuse-instance"

    -- Completion
    vim.g.vimtex_complete_enabled = 1

    -- Quickfix
    vim.g.vimtex_quickfix_mode = 0

    -- Keymaps
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    keymap("n", "<leader>lc", ":VimtexCompile<CR>", opts)
    keymap("n", "<leader>lv", ":VimtexView<CR>", opts)
    keymap("n", "<leader>ls", ":VimtexStop<CR>", opts)
    keymap("n", "<leader>lC", ":VimtexClean<CR>", opts)
    keymap("n", "<leader>le", ":VimtexErrors<CR>", opts)
    keymap("n", "<leader>li", ":VimtexInfo<CR>", opts)
    keymap("n", "<leader>lx", "<cmd>Trouble quickfix<CR>", opts)

    -- Indent & fold
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_fold_enabled = 1
    vim.cmd([[
      setlocal foldmethod=expr
      setlocal foldexpr=vimtex#fold#level()
      setlocal foldlevel=2
    ]])

    -- Conceal
    vim.cmd([[
      augroup VimTeXConceal
        autocmd!
        autocmd InsertEnter *.tex set conceallevel=0
        autocmd InsertLeave *.tex set conceallevel=2
      augroup END
    ]])
    vim.o.concealcursor = ""
    vim.g.vimtex_syntax_conceal = {
      accents = 1, cites = 1, fancy = 1, greek = 1,
      math_bounds = 0, math_delimiters = 0, math_fracs = 1,
      math_super_sub = 1, math_symbols = 1, sections = 1, styles = 1,
    }
  end,
}
