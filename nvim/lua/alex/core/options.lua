local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)
opt.fillchars = { eob = " " }


-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- Automatically break lines after "" characters (You had it set
-- on 80 for much of your config)
vim.opt.textwidth = 65
vim.opt.formatoptions:append("t")  -- Automatically format text to fit within textwidth

-- Automatically center the current line after every cursor move
vim.cmd([[
  autocmd CursorMoved * normal! zz
]])


-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
-- opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- My Additions (Mostly from kickstart)

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Minimal number ofscreen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Allow Folding
vim.opt.foldmethod = "syntax"
vim.opt.foldenable = true

-- Set Conceallevel
vim.opt.conceallevel = 2
