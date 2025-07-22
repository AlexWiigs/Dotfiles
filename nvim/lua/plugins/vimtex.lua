return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    -- Basic VimTeX settings
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_view_general_viewer = "skim"
    vim.g.vimtex_view_general_options = "--reuse-instance"
    vim.g.vimtex_complete_enabled = 1
    vim.g.vimtex_indent_enabled = 1
    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_quickfix_open_on_warning = 0

    -- Conceal settings
    vim.g.vimtex_syntax_conceal = {
      accents = 0,
      cites = 0,
      fancy = 1,
      greek = 1,
      math_bounds = 0,
      math_delimiters = 0,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 0,
    }
    vim.o.concealcursor = "nc"

    -- Buffer-local settings for TeX files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "vimtex#fold#level()"
        vim.opt_local.foldlevel = 2
      end,
    })

    -- Auto toggle conceal in insert mode
    vim.api.nvim_create_autocmd({ "InsertEnter" }, {
      pattern = "*.tex",
      callback = function()
        vim.opt_local.conceallevel = 0
      end,
    })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      pattern = "*.tex",
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })

    -- Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap("n", "<leader>lc", "<cmd>VimtexCompile<CR>", opts)
    keymap("n", "<leader>lv", "<cmd>VimtexView<CR>", opts)
    keymap("n", "<leader>ls", "<cmd>VimtexStop<CR>", opts)
    keymap("n", "<leader>lC", "<cmd>VimtexClean<CR>", opts)
    keymap("n", "<leader>le", "<cmd>VimtexErrors<CR>", opts)
    keymap("n", "<leader>li", "<cmd>VimtexInfo<CR>", opts)
    keymap("n", "<leader>lx", "<cmd>Trouble quickfix<CR>", opts) -- optional: if using trouble.nvim
  end,
}
