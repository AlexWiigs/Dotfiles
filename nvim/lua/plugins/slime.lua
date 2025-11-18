return {
  "jpalardy/vim-slime",
  config = function()
    -- Use tmux as the target
    vim.g.slime_target = "tmux"

    -- Always send to this tmux session/pane unless you manually change it
    vim.g.slime_default_config = {
      socket_name = "default",       -- your tmux socket
      target_pane = "workspace:0.0", -- your tmux pane
    }

    vim.g.slime_dont_ask_default = 1

    ------------------------------------------------------------------------
    -- Helper: send fenced block in a .qmd / .md file
    ------------------------------------------------------------------------
    local function send_current_fence()
      local buf = vim.api.nvim_get_current_buf()
      local total_lines = vim.api.nvim_buf_line_count(buf)
      local cur_line = vim.api.nvim_win_get_cursor(0)[1]

      -- find start fence
      local start_line = cur_line
      while start_line > 1 do
        local line = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1]
        if line:match("^```") then break end
        start_line = start_line - 1
      end

      local start_text = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1]
      if not (start_text and start_text:match("^```")) then
        vim.notify("No fenced block start found above cursor", vim.log.levels.WARN)
        return
      end

      -- find end fence
      local end_line = start_line + 1
      while end_line <= total_lines do
        local line = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1]
        if line:match("^```") then break end
        end_line = end_line + 1
      end

      local end_text = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1]
      if not (end_text and end_text:match("^```")) or end_line <= start_line + 1 then
        vim.notify("No fenced block end found below cursor", vim.log.levels.WARN)
        return
      end

      -- get the block body and send as a single string
      local body = vim.api.nvim_buf_get_lines(buf, start_line, end_line - 1, false)
      if #body == 0 then
        vim.notify("Fenced block is empty", vim.log.levels.INFO)
        return
      end

      local text = table.concat(body, "\n") .. "\n"
      vim.fn["slime#send"](text)
    end

    ------------------------------------------------------------------------
    -- Keymaps
    ------------------------------------------------------------------------
    -- Send fenced block
    vim.keymap.set("n", "<M-c>", send_current_fence, { desc = "Send fenced block to REPL" })
    vim.keymap.set("v", "<M-c>", function()
      vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<Esc>", true, false, true),
        "nx",
        false
      )
      send_current_fence()
    end, { desc = "Send fenced block to REPL" })

    -- Send all lines in the current buffer
    vim.keymap.set("n", "<leader>sa", function()
      local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      local text = table.concat(lines, "\n") .. "\n"
      vim.fn["slime#send"](text)
    end, { desc = "Send entire buffer to REPL" })

    -- Send currently visually selected lines
    vim.keymap.set("v", "<leader>sv", function()
      local start_line = vim.fn.line("v")
      local end_line = vim.fn.line(".")
      if start_line > end_line then start_line, end_line = end_line, start_line end
      local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      local text = table.concat(lines, "\n") .. "\n"
      vim.fn["slime#send"](text)
    end, { desc = "Send visual selection to REPL" })
  end,
}
