-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

--  NOTE: Try to put this in Markview
keymap.set("n", "<leader>mm", "<Cmd>Markview Toggle<cr>", { desc = "Toggle Markview" }) -- split window vertically

-- clear search highlights
keymap.set("n", "<leader>cs", ":nohl<CR>", { desc = "Clear search highlights" })

-- Disable arrow keys
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Swap b and B, and e and E
vim.keymap.set({ "n", "v" }, "b", "B", { noremap = true })
vim.keymap.set({ "n", "v" }, "B", "b", { noremap = true })
vim.keymap.set({ "n", "v" }, "e", "E", { noremap = true })
vim.keymap.set({ "n", "v" }, "E", "e", { noremap = true })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Save and Exit
keymap.set("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save current session" }) -- split window vertically
keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { desc = "Save and quit session" }) -- split window horizontally

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

-- Oil
vim.keymap.set("n", "<leader>i", "<cmd>Oil<cr>", { noremap = true, silent = true })

-- To-Do Toggle
keymap.set("n", "<leader>dd", "<cmd>Dooing<CR>", { desc = "Split window vertically" }) -- split window vertically

-- remap record so you stop pressing it by accident
-- vim.keymap.set("n", "q", "<Nop>", { noremap = true })
-- vim.keymap.set("n", "QQ", "qq", { noremap = true })

vim.keymap.set("n", "<leader>lx", "<cmd>Trouble quickfix<CR>", { noremap = true, silent = true })

-- Show node path levels
vim.keymap.set("n", "<leader>tn", function()
	local node = vim.treesitter.get_node()
	local types = {}
	while node do
		table.insert(types, node:type())
		node = node:parent()
	end
	print("Node path: " .. table.concat(types, " -> "))
end, { desc = "Show Tree-sitter node path" })
