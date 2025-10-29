return {
  "jpalardy/vim-slime",
  config = function()
    -- Use tmux as the target
    vim.g.slime_target = "tmux"

    -- Always send to this tmux session/pane unless you manually change it
    vim.g.slime_default_config = {
      socket_name = "default",        -- your tmux socket
      target_pane = "workspace:0.0",  -- your tmux pane
    }

    -- Don't prompt every time
    vim.g.slime_dont_ask_default = 1

    ------------------------------------------------------------------------
    -- Helper: send the current fenced code block in a .qmd / .md file
    -- to the configured slime target.
    --
    -- Behavior:
    -- - Put cursor anywhere inside a ```{python} ... ``` block (or ```{r}```, etc.)
    -- - Hit <leader>rr
    -- - It will grab everything between the fences (excluding the ``` line)
    --   and send it to tmux via slime.
    --
    -- We do NOT try to be clever about language. We just blast the block
    -- to the same REPL.
    ------------------------------------------------------------------------

    local function send_current_fence()
      local buf = vim.api.nvim_get_current_buf()
      local total_lines = vim.api.nvim_buf_line_count(buf)
      local cur_line = vim.api.nvim_win_get_cursor(0)[1]

      -- 1. find the start fence (``` ...)
      local start_line = cur_line
      while start_line > 1 do
        local line = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1]
        if line:match("^```") then
          break
        end
        start_line = start_line - 1
      end

      -- sanity: if we didn't actually land on a fence, bail
      local start_text = vim.api.nvim_buf_get_lines(buf, start_line - 1, start_line, false)[1]
      if not (start_text and start_text:match("^```")) then
        vim.notify("No fenced block start found above cursor", vim.log.levels.WARN)
        return
      end

      -- 2. find the end fence (next ``` after start_line)
      local end_line = start_line + 1
      while end_line <= total_lines do
        local line = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1]
        if line:match("^```") then
          break
        end
        end_line = end_line + 1
      end

      -- if we ran off the end or never saw a closing fence, bail
      local end_text = vim.api.nvim_buf_get_lines(buf, end_line - 1, end_line, false)[1]
      if not (end_text and end_text:match("^```")) or end_line <= start_line + 1 then
        vim.notify("No fenced block end found below cursor", vim.log.levels.WARN)
        return
      end

      -- 3. grab the body of the block
      --    (lines between the opening fence and closing fence)
      local body = vim.api.nvim_buf_get_lines(buf, start_line, end_line - 1, false)

      if #body == 0 then
        vim.notify("Fenced block is empty", vim.log.levels.INFO)
        return
      end

      -- 4. send via slime
      -- slime#send takes a list of lines or a string; we'll send as one string
      local chunk = table.concat(body, "\n") .. "\n"
      vim.fn["slime#send"]({ chunk })
    end

    ------------------------------------------------------------------------
    -- Keymaps
    ------------------------------------------------------------------------

    -- Normal "send current line / visual selection" still works with vim-slime's defaults,
    -- but we add our fenced-block sender on <leader>rr.
    vim.keymap.set(
      "n",
      "<leader>rr",
      send_current_fence,
      { desc = "Send fenced block to slime REPL" }
    )

    -- Optional: also allow sending the block from visual mode (cursor just has to be inside it)
    vim.keymap.set(
      "v",
      "<leader>rr",
      function()
        -- exit visual back to normal on the same line, then call it
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
        send_current_fence()
      end,
      { desc = "Send fenced block to slime REPL" }
    )
  end,
}
