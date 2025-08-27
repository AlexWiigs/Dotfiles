return {
  'chomosuke/typst-preview.nvim',
  lazy = false,
  version = '1.*',
  opts = {},
  init = function()
    -- Set textwidth=80 only for Typst buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "typst",
      callback = function()
        vim.bo.textwidth = 80
      end,
    })
  end,
  keys = {
    {
      '<leader>tc',
      function()
        local file = vim.api.nvim_buf_get_name(0)
        if file == '' or not file:match('%.typ$') then
          vim.notify('Not a .typ file', vim.log.levels.WARN)
          return
        end

        -- Mirror PDFs under ~/notes/typst/** when source is under ~/Documents/Projects/typst/**
        local src_root = vim.fn.expand('~/Documents/Projects/typst/')  -- with trailing slash
        local dst_root = vim.fn.expand('~/notes/typst/')               -- with trailing slash
        local pdf

        if file:sub(1, #src_root) == src_root then
          local rel = file:sub(#src_root + 1)                 -- path relative to src_root
          pdf = dst_root .. rel:gsub('%.typ$', '.pdf')        -- mirror path, swap extension
          vim.fn.mkdir(vim.fn.fnamemodify(pdf, ':h'), 'p')    -- ensure parent dirs
        else
          -- Fallback: write PDF next to the source file
          pdf = file:gsub('%.typ$', '.pdf')
        end

        vim.fn.jobstart(
          { 'typst', 'compile', file, pdf },
          {
            stdout_buffered = true,
            stderr_buffered = true,
            on_exit = function(_, code)
              if code == 0 then
                vim.notify('Typst compiled → ' .. pdf)
                -- Skim: revert if open, else open (forces refresh)
                local ascript = [[
                  tell application "Skim"
                    set p to POSIX file "]] .. pdf .. [["
                    try
                      set d to first document whose path = "]] .. pdf .. [["
                      revert d
                    on error
                      open p
                    end try
                    activate
                  end tell
                ]]
                vim.fn.jobstart({ 'osascript', '-e', ascript }, { detach = true })
              else
                vim.notify('typst compile failed (exit ' .. code .. ')', vim.log.levels.ERROR)
              end
            end,
          }
        )
      end,
      desc = 'Typst: Compile current file (open/refresh in Skim)',
      mode = 'n',
    },
  },
}
