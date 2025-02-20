return {
    "tokyonight",
    lazy = false,
    before = function()
        deps.add({ source = "folke/tokyonight.nvim", name = "tokyonight" })
    end,
    after = function()
        require("tokyonight").setup {
            style = "night",
        }
        vim.cmd.colorscheme "tokyonight"
    end
}
