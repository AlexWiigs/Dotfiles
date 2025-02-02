local ts_utils = require("nvim-treesitter.ts_utils")

function PrintNodeType()
	local node = ts_utils.get_node_at_cursor()
	if node then
		print("Node type: " .. node:type())
	else
		print("No node at cursor")
	end
end

vim.keymap.set("n", "<leader>nt", PrintNodeType, { desc = "Print current node type" })
