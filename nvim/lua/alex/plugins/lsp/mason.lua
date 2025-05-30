return {
	"williamboman/mason.nvim",
	version = "1.11.0", -- last version before v2.0 breaking changes
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			version = "1.32.0", -- last compatible version
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			version = "*", -- or pin to a known version if needed
		},
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"texlab",
				"r_language_server",
				"jsonls",
				"yamlls",
				"marksman",
				"html",
				"sqlls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier",
				"stylua",
				"isort",
				"black",
				"latexindent",
				"sqlfluff",
			},
		})
	end,
}
