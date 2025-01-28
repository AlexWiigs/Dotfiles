return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = true,
}

-- Surround words with ys iw then character eg: ysiw)
-- Make strings with ys$
-- delete surround around cursor with ds then character. eg: ds)
-- change quotes around cursor with cs then current then new. eg: cs'"
--
