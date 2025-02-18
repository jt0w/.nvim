return {
    "rose-pine",
    lazy = false,
    before = function()
        deps.add({ source = "rose-pine/neovim", name = "rose-pine" })
    end,
    after = function()
        vim.cmd.colorscheme "rose-pine"
    end
}
