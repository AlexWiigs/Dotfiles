-- return {
--     "benlubas/molten-nvim",
--     version = "^1.0.0",
--     lazy = true,
--     build = ":UpdateRemotePlugins",
--     init = function()
--         vim.g.molten_output_win_max_height = 12
--     end,
-- }

return {
     "benlubas/molten-nvim",
    version = "*", -- Use the latest version
    lazy = true,
    build = ":UpdateRemotePlugins",
    cmd = { "MoltenStart", "MoltenSend" }, -- Commands that load the plugin
    init = function()
        vim.g.molten_output_win_max_height = 12
    end,
    config = function()
        require("molten").setup({
            ensure_installed = { "python", "r" },
            auto_start = true,
            python = {
                cmd = { vim.fn.expand("~/.dotfiles/venv/bin/python") },
            },
            r = {
                cmd = { "R" },
            },
        })
    end,
}
