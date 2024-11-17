return {
    "benlubas/molten-nvim",
    version = "*",
    -- version = "v1.0.0",  -- Use version <2.0.0 to avoid breaking changes
    lazy = false,        -- Ensure it loads without waiting for an event
    build = ":UpdateRemotePlugins",
    init = function()
        vim.g.molten_output_win_max_height = 15
        vim.g.molten_latex_cmd = 'latexmk -pdf -interaction=nonstopmode -output-directory=%o %f'
    end,
}
