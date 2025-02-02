local M = {}

-- Markdown functions
function M.is_in_latex_mode()
	local ts_utils = require("nvim-treesitter.ts_utils")
	local node = ts_utils.get_node_at_cursor()
	while node do
		if node:type() == "latex_block" then
			return true
		end
		node = node:parent()
	end
	return false
end

function M.not_in_latex_mode()
	return not M.is_in_latex_mode()
end

return M
