return {
    "kanagawa.nvim",
    lazy = false,
    before = function()
        deps.add({ source = "rebelot/kanagawa.nvim" })
    end,
    after = function()
        require("kanagawa").setup {
            theme = "dragon",
            background = {
                dark = "dragon",
            }
        }
        vim.cmd.colorscheme "kanagawa"
    end
}
