return {
    "gruvbox.nvim",
    lazy = false,
    before = function()
        deps.add({ source = "ellisonleao/gruvbox.nvim" })
    end,
    after = function()
        vim.cmd.colorscheme "gruvbox"
    end
}
