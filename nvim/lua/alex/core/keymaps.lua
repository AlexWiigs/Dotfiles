-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

--  NOTE: Try to put this in Markview
keymap.set("n", "<leader>mm", "<Cmd>Markview Toggle<cr>", { desc = "Toggle Markview" }) -- split window vertically

-- clear search highlights
keymap.set("n", "<leader>cs", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Save and Exit
keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Split window horizontally" }) -- split window horizontally

-- luasnip
vim.cmd([[
" Use Tab to expand or jump through snippets
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]])

-- Obsidian keymaps
vim.keymap.set("n", "<leader>o", "<cmd>ObsidianSearch<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>d", function()
	if vim.g.current_colorscheme == "nordfox" then
		vim.cmd("colorscheme dawnfox")
		vim.g.current_colorscheme = "dawnfox"
	else
		vim.cmd("colorscheme nordfox")
		vim.g.current_colorscheme = "nordfox"
	end
end, { noremap = true, silent = true })

-- Misc
vim.api.nvim_set_keymap("i", "<Tab>", "<Nop>", { noremap = true, silent = true })
