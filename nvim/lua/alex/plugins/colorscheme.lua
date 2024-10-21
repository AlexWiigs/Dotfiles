return{
    -- 'catppuccin/nvim',
    -- config = function()
    --     require('catppuccin').setup({
    --         flavour = 'frappe', -- options: latte, frappe, macchiato, mocha
    --         transparent_background = true,
    --     })
    --     vim.cmd('colorscheme catppuccin')
    -- end
  
    'sainnhe/everforest',
    config = function()
        vim.g.everforest_background = 'soft' -- options: hard, medium, soft
        vim.g.everforest_transparent_background = 0
        vim.cmd('colorscheme everforest')
    end

}

