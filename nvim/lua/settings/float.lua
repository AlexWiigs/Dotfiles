  -- create a listed buffer
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

  -- size and position (70% of screen, centered)
  local width  = math.floor(vim.o.columns * 0.7)
  local height = math.floor(vim.o.lines * 0.7)

  local opts   = {
    relative = "editor",
    style    = "minimal",
    width    = width,
    height   = height,
    row      = (vim.o.lines - height) / 2,
    col      = (vim.o.columns - width) / 2,
    border   = "rounded",
  }

  vim.api.nvim_open_win(buf, true, opts)
  vim.cmd("edit " .. filename)
end

-- Build today's Obsidian daily note path --------------------------
local function today_journal_path()
  -- <<< change this to your daily-note folder inside the vault >>>
  local dir = vim.fn.expand("~/Documents/github.com/journal/calendar/daily/")

  -- <<< change this format to match your daily-note filenames >>>
  -- e.g. "%Y-%m-%d" -> "2025-11-17.md"
  --      "%Y%m%d"   -> "20251117.md"
  local date_format = "%Y-%m-%d"

  local date = os.date(date_format)

  -- ensure directory exists (creates it if missing)
  vim.fn.mkdir(dir, "p")

  return string.format("%s/%s.md", dir, date)
end

-- Keymap: open today's journal in a float -------------------------
vim.keymap.set("n", "<leader>jd", function()
  float_edit(today_journal_path())
end, { desc = "Open today's journal (float)" })

-- Optional: float current buffer too ------------------------------
vim.keymap.set("n", "<leader>fd", function()
  float_edit(vim.api.nvim_buf_get_name(0))
end, { desc = "Float current buffer" })
