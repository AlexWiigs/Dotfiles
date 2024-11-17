-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

vim.cmd[[
" Use Tab to expand and jump through snippets
imap <silent><expr> jk luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

" Use Shift-Tab to jump backwards through snippets
imap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
smap <silent><expr> kj luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
]]

-- Remap "e" to act like "E"
vim.keymap.set("n", "e", "E", { noremap = true, silent = true, desc = "Move to end of word (inclusive)" })

-- Remap "b" to act like "B"
vim.keymap.set("n", "b", "B", { noremap = true, silent = true, desc = "Move to beginning of word (inclusive)" })

-- Molten Commands

-- Create an autocmd for Quarto files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "quarto",  -- Only apply to Quarto filetypes
    callback = function()
        local opts = { noremap = true, silent = true }  -- Common options

        -- Normal mode keymaps

        vim.keymap.set("n", "<leader>qq", ":QuartoPreview<CR>", opts)
        vim.keymap.set("n", "<leader>qc", ":QuartoClosePreview<CR>", opts)
        vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", opts)
        vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", opts)
        vim.keymap.set("n", "<leader>mc", ":MoltenReevaluateCell<CR>", opts)
        vim.keymap.set("n", "<leader>md", ":MoltenDeleteCell<CR>", opts)
        vim.keymap.set("n", "<leader>md", ":MoltenDeinit<CR>", opts)

        vim.keymap.set("n", "<leader>oo", ":noautocmd MoltenEnterOutput<CR>", opts)
        vim.keymap.set("v", "<leader>e", ":<C-U>MoltenEvaluateVisual<CR>", opts)
        vim.keymap.set("n", "<leader>on", ":MoltenNext<CR>", opts)
        vim.keymap.set("n", "<leader>op", ":MoltenPrev<CR>", opts)
        vim.keymap.set("n", "<leader>mh", ":MoltenHideOutput<CR>", opts)
    end,
})

