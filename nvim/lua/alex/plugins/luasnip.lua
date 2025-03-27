return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		local luasnip = require("luasnip")
		require("luasnip").cleanup()
		require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/lua/alex/LuaSnip/tex/" } })

		-- Setup LuaSnip (if you want to keep snippets for other purposes)
		luasnip.config.set_config({
			enable_autosnippets = true,
			store_selection_keys = "<tab>",
			update_events = "TextChanged, TextChangedI",
		})
	end,
}
