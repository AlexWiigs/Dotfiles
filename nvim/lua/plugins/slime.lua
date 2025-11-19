return {
  "jpalardy/vim-slime",
  config = function()
    -- Use tmux as the slime target
    vim.g.slime_target = "tmux"

    -- Default tmux socket and pane (adjust to your layout)
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = "workspace:0.0",
    }

    -- Do not prompt every time; use the default tmux target
    vim.g.slime_dont_ask_default = 1

    ------------------------------------------------------------------------
    -- Keymaps: send buffer / visual selection
    ------------------------------------------------------------------------

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
      if start_line > end_line then
        start_line, end_line = end_line, start_line
      end
      local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
      local text = table.concat(lines, "\n") .. "\n"
      vim.fn["slime#send"](text)
    end, { desc = "Send visual selection to REPL" })
  end,
}
