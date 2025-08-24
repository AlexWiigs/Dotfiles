return {
  'chomosuke/typst-preview.nvim',
  lazy = false,
  version = '1.*',
  opts = {},
  keys = {
    {
      '<leader>tc',
      function()
        local file = vim.api.nvim_buf_get_name(0)
        if file == '' or not file:match('%.typ$') then
          vim.notify('Not a .typ file', vim.log.levels.WARN)
          return
        end
        local pdf = file:gsub('%.typ$', '.pdf')
        vim.fn.jobstart(
          { 'typst', 'compile', file, pdf },
          {
            stdout_buffered = true,
            stderr_buffered = true,
            on_exit = function(_, code)
              if code == 0 then
                vim.notify('Typst compiled → ' .. pdf)
                -- Open in Skim (macOS)
                vim.fn.jobstart({ 'open', '-a', 'Skim', pdf }, { detach = true })
              else
                vim.notify('typst compile failed (exit ' .. code .. ')', vim.log.levels.ERROR)
              end
            end,
          }
        )
      end,
      ft = 'typst',
      desc = 'Typst: Compile current file (open in Skim)',
    },
  },
}
