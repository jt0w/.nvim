return {
    "catppuccin",
    lazy = false,
    before = function()
        deps.add({ source = "catppuccin/nvim", name = "catppuccin" })
    end,
    after = function()
        require ("catppuccin").setup {
            flavour = "latte"
        }
        vim.cmd.colorscheme "catppuccin"
    end
}
