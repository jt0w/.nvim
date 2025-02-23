return {
    "cyberdream.nvim",
    lazy = false,
    before = function()
        deps.add({ source = "scottmckendry/cyberdream.nvim" })
    end,
    after = function()
        require("cyberdream").setup {
            variant = "auto",
            transparent = true,
        }
        vim.cmd.colorscheme "cyberdream"
    end
}
