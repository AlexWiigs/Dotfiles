return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {

		disable_spellcheck = true,

		workspaces = {
			{
				name = "Current",
				path = "~/notes/",
			},
		},

		notes_subdir = "files",
		log_level = vim.log.levels.INFO,

		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},

		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			return title or tostring(os.time())
		end,

		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end,

		wiki_link_func = function(opts)
			return require("obsidian.util").wiki_link_id_prefix(opts)
		end,

		markdown_link_func = function(opts)
			return require("obsidian.util").markdown_link(opts)
		end,

		preferred_link_style = "markdown", -- markdown or wiki
		disable_frontmatter = true,

		-- note_frontmatter_func = function(note)
		-- 	if note.title then
		-- 		note:add_alias(note.title)
		-- 	end
		--
		-- 	local out = { id = note.id }
		--
		-- 	if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
		-- 		for k, v in pairs(note.metadata) do
		-- 			out[k] = v
		-- 		end
		-- 	end
		--
		-- 	return out
		-- end,

		templates = {
			folder = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			substitutions = {},
		},

		follow_url_func = function(url)
			vim.fn.jobstart({ "open", url })
		end,

		follow_img_func = function(img)
			vim.fn.jobstart({ "qlmanage", "-p", img })
		end,

		use_advanced_uri = false,
		open_app_foreground = false,

		picker = {
			name = "telescope.nvim",
			note_mappings = {
				new = "<C-x>",
				insert_link = "<C-l>",
			},
			tag_mappings = {
				tag_note = "<C-x>",
				insert_tag = "<C-l>",
			},
		},

		sort_by = "modified",
		sort_reversed = true,
		search_max_lines = 1000,
		open_notes_in = "current",

		-- My command for set conceal level higher
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "markdown",
			callback = function()
				vim.opt.conceallevel = 2 -- 0: Disable concealment, 1: Hide only specific characters, 2: Conceal fully
				vim.opt.concealcursor = "nc" -- Conceal in normal mode but show in insert mode
			end,
		}),

		ui = {
			enable = false,
			update_debounce = 200,
			max_file_length = 5000,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
			},
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = false, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
				ObsidianInvalidLink = { fg = "#5c6370" }, -- My attempt
			},
		},

		attachments = {
			img_folder = "assets/imgs",
			img_name_func = function()
				return string.format("%s-", os.time())
			end,
			img_text_func = function(client, path)
				path = client:vault_relative_path(path) or path
				-- Ensure only actual image files get formatted as images
				if path:match("%.png$") or path:match("%.jpg$") or path:match("%.jpeg$") or path:match("%.gif$") then
					return string.format("![%s](%s)", path.name, path)
				else
					return string.format("[%s](%s)", path.name, path) -- Use a standard markdown link for non-image files
				end
			end,
		},
	},
}
