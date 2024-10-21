
-- Render Code within neovim

return {
    'hkupty/iron.nvim',
    config = function()
        -- Function to detect if a block is an R block
        local function is_r_block(line)
            return line:match("^```{r}") ~= nil
        end

        -- Custom function to send code blocks to the R REPL only if it's an R block
        local function send_r_code_if_in_r_block()
            local line_number = vim.fn.line('.')
            local line = vim.fn.getline(line_number)
            -- Check if current line is the start of an R block
            if is_r_block(line) then
                -- Send to R REPL
                require('iron.core').send(nil, vim.fn.getline(line_number + 1, vim.fn.line('$')))
            else
                print("Not in an R block")
            end
        end

        -- Iron setup
        require('iron.core').setup({
            config = {
                -- Use the R REPL for quarto
                repl_definition = {
                    quarto = {
                        command = {"R"}
                    },
                },
                preferred = {
                    quarto = "quarto",  -- Map quarto to the R REPL
                },
                repl_open_cmd = "vertical botright 60vsplit",
            },
            keymaps = {
                send_motion = "<leader>sc",
                visual_send = "<leader>sc",
                send_file = "<leader>sf",
                send_line = "<leader>sl",
                send_until_cursor = "<leader>sL",
                send_mark = "<leader>sm",
                mark_motion = "<leader>mc",
                mark_visual = "<leader>mc",
                remove_mark = "<leader>md",
                cr = "<leader>s<cr>",
                interrupt = "<leader>s<esc>",
                exit = "<leader>sq",
                clear = "<leader>sclear"
            },
            highlight = {
                italic = true
            },
            ignore_blank_lines = true
        })

        -- Map a custom command to check if we're in an R block
        vim.api.nvim_set_keymap('n', '<leader>rblock', '<cmd>lua send_r_code_if_in_r_block()<CR>', { noremap = true, silent = true })
    end
}

