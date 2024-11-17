-- quarto.lua
return {
    'quarto-dev/quarto-nvim',
    dependencies = {
        { 'jmbuhr/otter.nvim', config = true },
    },
    config = function()
        require('quarto').setup {
            closePreviewOnExit = true,
        }
    end
}
