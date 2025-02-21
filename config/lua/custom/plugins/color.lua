return {
    "catppuccin",
    lazy = false,
    before = function()
        deps.add({ source = "catppuccin/nvim", name = "catppuccin" })
    end,
    after = function()
        vim.cmd.colorscheme "catppuccin"
    end
}
